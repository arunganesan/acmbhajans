class RenditionsController < ApplicationController
    require "time"
    skip_before_action :verify_authenticity_token

    def edit
      if request.post?
        if params['id'] == ''
          rendition = Rendition.new  
        else
          rendition = Rendition.find_by(id: params['id'])
        end
  
        rendition.recording_url = params['recording_url']
        rendition.shruti = params['shruti']

        rendition.weekend = Date.parse(params['weekend'])

        rendition.bhajan = Bhajan.find_by(id: params['bhajan_id'])
        rendition.event = Event.find_by(id: params['event_id'])
        
        rendition.lead.delete_all
        params['lead'].each do |person_id| 
          rendition.lead << Person.find_by(id: person_id)
        end

        rendition.backup.delete_all
        params['backup'].each do |person_id| 
          rendition.backup << Person.find_by(id: person_id)
        end

        rendition.instrumentalists.delete_all
        params['instrumentalists'].each do |person_id| 
          rendition.instrumentalists << Person.find_by(id: person_id)
        end

        
        rendition.soundsystem.delete_all
        params['soundsystem'].each do |person_id| 
          rendition.soundsystem << Person.find_by(id: person_id)
        end
        
        rendition.save!
      end
      
      lead_list_indices = {}
      backup_list_indices = {}
      instrumentalists_list_indices = {}
      soundsystem_list_indices = {}

      all_renditions = Rendition.where('weekend >= :from AND weekend <= :to', {
        from: params[:from],
        to: params[:to]
      }).all.order(weekend: :desc, bhajan_id: :desc)
      
      all_renditions.each do | rendition | 
        lead_list_indices[rendition['id']] = rendition.lead.map { | person | person.id }
        backup_list_indices[rendition['id']] = rendition.backup.map { | person | person.id }
        instrumentalists_list_indices[rendition['id']] = rendition.instrumentalists.map { | person | person.id }
        soundsystem_list_indices[rendition['id']] = rendition.soundsystem.map { | person | person.id }
      end
  
  
      render :json => {
        'renditions': all_renditions,
        'bhajans': Bhajan.all,
        'events': Event.all,
        'people': Person.all,

        # unique list
        'lead_list': lead_list_indices,
        'backup_list': backup_list_indices,
        'instrumentalists_list': instrumentalists_list_indices,
        'soundsystem_list': soundsystem_list_indices, 
      }
    end


    def summarize
      event = Event.find_by(name: params[:event])
      renditions = Rendition.where(event: event)
      #, weekend: Date.parse('2019-08-17'))
      # eventually store in format:
      # [week][person] = list of bhajans

      bhajan_summary = {}
      attendance_summary = {}

      renditions.each do | rendition |
        date = rendition.weekend
        if !bhajan_summary.key? date
          bhajan_summary[date] = {}
          attendance_summary[date] = {}
        end
        
        rendition.lead.each do | person |
          if !bhajan_summary[date].key? person.name
            bhajan_summary[date][person.name] = []
            attendance_summary[date][person.name] = false
          end

          request_obj = Request.find_by(person_id: person.id, weekend: date)
          if !request_obj.blank?
            if params[:event] == 'practice'
              attendance_summary[date][person.name] = request_obj.attended_practice
            else
              attendance_summary[date][person.name] = request_obj.attended_satsang
            end
          end
          
          if !rendition.bhajan.blank? 
            bhajan_summary[date][person.name] << rendition.bhajan.name
          end
        end
      end
      
      render :json => {
        'bhajan_summary': bhajan_summary,
        'attendance_summary': attendance_summary,
        'bhajans': Bhajan.all,
        'events': Event.all,
        'people': Person.all,
      }
    end
  end
