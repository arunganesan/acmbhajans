class RenditionsController < ApplicationController
    require "time"
    skip_before_action :verify_authenticity_token

    ATTENDANCE_FILE = 'attendance.obj'
    BHAJAN_FILE = 'bhajan.obj'

    def edit
      if request.post?
        if params['id'] == ''
          rendition = Rendition.new  
        else
          rendition = Rendition.find_by(id: params['id'])
        end
  
        rendition.recording_url = params['recording_url']
        rendition.shruti = params['shruti']
        rendition.order = params['order']

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
      
      all_renditions = []
      if params.has_key? :person_id
        person = Person.find_by(id: params[:person_id])
        all_renditions = Rendition.all.select { | rendition | rendition.lead.include? person }
      else
        all_renditions = Rendition.where('weekend >= :from AND weekend <= :to', {
          from: params[:from],
          to: params[:to]
        }).all.order(weekend: :desc, order: :asc)
      end
      
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
      ActiveRecord::Base.logger = nil

      # save to file
      attendance_pickle = Marshal.dump(attendance_summary)
      bhajan_pickle = Marshal.dump(bhajan_summary)
      
      attendance_summary = Marshal.load(File.binread(ATTENDANCE_FILE))
      bhajan_summary = Marshal.load(File.binread(BHAJAN_FILE))

      render :json => {
        'bhajan_summary': bhajan_summary,
        'attendance_summary': attendance_summary,
        'bhajans': Bhajan.all,
        'events': Event.all,
        'people': Person.all,
      }
    end


    def generate_summary
      ActiveRecord::Base.logger = nil

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
        end
        
        rendition.lead.each do | person |
          if !bhajan_summary[date].key? person.name
            bhajan_summary[date][person.name] = []
          end

          if !rendition.bhajan.blank? 
            bhajan_summary[date][person.name] << rendition.bhajan.name
          end
        end
      end

      requests = Request.all()
      requests.each do | request_obj |
        # request_obj = Request.find_by(person_id: person.id, weekend: date)
        
        date = request_obj.weekend
        person = request_obj.person

        if person.nil? 
          next
        end
        
        if !attendance_summary.key? date
          attendance_summary[date] = {}
        end

        if params[:event] == 'practice'
          attendance_summary[date][person.name] = request_obj.attended_practice
        else
          attendance_summary[date][person.name] = request_obj.attended_satsang
        end
      end


      # save to file
      attendance_pickle = Marshal.dump(attendance_summary)
      bhajan_pickle = Marshal.dump(bhajan_summary)
      
      File.open(ATTENDANCE_FILE, 'wb') {|f| f.write(Marshal.dump(attendance_pickle))}
      File.open(BHAJAN_FILE, 'wb') {|f| f.write(Marshal.dump(bhajan_pickle))}

      header :ok
      return
    end
  end
