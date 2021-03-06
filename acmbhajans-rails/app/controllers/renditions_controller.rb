class RenditionsController < ApplicationController
    require "time"
    skip_before_action :verify_authenticity_token

    PRACTICE_ATTENDANCE_FILE = 'practice_attendance.obj'
    PRACTICE_BHAJAN_FILE = 'practice_bhajan.obj'

    SATSANG_ATTENDANCE_FILE = 'satsang_attendance.obj'
    SATSANG_BHAJAN_FILE = 'satsang_bhajan.obj'

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

      event = Event.find_by(name: params[:event])

      # save to file
      if params[:event] ==  'practice'
        attendance_summary = JSON.load File.new(PRACTICE_ATTENDANCE_FILE)
        bhajan_summary = JSON.load File.new(PRACTICE_BHAJAN_FILE)
      else
        attendance_summary = JSON.load File.new(SATSANG_ATTENDANCE_FILE)
        bhajan_summary = JSON.load File.new(SATSANG_BHAJAN_FILE)
      end

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

      # Generate for both practice and satsang
      event_names = ['satsang', 'practice']
      event_names.each do | event_name |
        event = Event.find_by(name: event_name)
        renditions = Rendition.where(event: event)
        #, weekend: Date.parse('2019-08-17'))
        # eventually store in format:
        # [week][person] = list of bhajans
  
        bhajan_summary = {}
        attendance_summary = {}
  
        today = Date.today

        renditions.each do | rendition |
          date = rendition.weekend
          if date >= today
            next
          end
          
          if !bhajan_summary.key? date
            bhajan_summary[date] = {}
          end
          
          rendition.lead.each do | person |
            if !bhajan_summary[date].key? person.name
              bhajan_summary[date][person.name] = []
            end
  
            if !rendition.bhajan.blank?
              name = rendition.bhajan.name
              if !rendition.shruti.blank?
                name = name + " (#{rendition.shruti})"
              end

              bhajan_summary[date][person.name] << name
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


          if date >= today
            next
          end
          
          
          if !attendance_summary.key? date
            attendance_summary[date] = {}
          end
  
          if event.name == 'practice'
            attendance_summary[date][person.name] = request_obj.attended_practice
          else
            attendance_summary[date][person.name] = request_obj.attended_satsang
          end
        end
  
  
        # save to file
        attendance_json = JSON.dump(attendance_summary)
        bhajan_json = JSON.dump(bhajan_summary)
        
        if event.name == 'practice'
          File.open(PRACTICE_ATTENDANCE_FILE, 'w') {|f| f.write(attendance_json)}
          File.open(PRACTICE_BHAJAN_FILE, 'w') {|f| f.write(bhajan_json)}
        else
          File.open(SATSANG_ATTENDANCE_FILE, 'w') {|f| f.write(attendance_json)}
          File.open(SATSANG_BHAJAN_FILE, 'w') {|f| f.write(bhajan_json)}
        end
  
      end

      head :ok
      return
    end
  end
