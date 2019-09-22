class RequestController < ApplicationController
  require "time"
  skip_before_action :verify_authenticity_token

  def edit
    if request.post?
      puts params

      if params['id'] == '' || params['id'].nil?
        request_obj = Request.new  
      else
        request_obj = Request.find_by(id: params['id'])
      end

      request_obj.will_attend_practice = params['will_attend_practice']
      request_obj.will_attend_satsang = params['will_attend_satsang']

      request_obj.attended_practice = params['attended_practice']
      request_obj.attended_satsang = params['attended_satsang']
      
      request_obj.practice_note = params['practice_note']
      request_obj.satsang_note = params['satsang_note']

      request_obj.weekend = Date.parse(params['weekend'])
      request_obj.person = Person.find_by(id: params['person_id'])

      request_obj.practice_request = Bhajan.find_by(id: params['practice_request_id'])
      request_obj.satsang_request = Bhajan.find_by(id: params['satsang_request_id'])

      request_obj.save!
    end

    
    personal_request = []
    if params.has_key? :personal_request
      # if not found
      personal_request = Request.where('weekend = :date AND person_id = :person_id', {
        date: params[:date],
        person_id: params[:person_id],
      })

      if personal_request.blank? and params.has_key? :person_id and params[:person_id] != 'null'
        obj = Request.new
        obj.weekend = Date.parse(params[:date])
        obj.person = Person.find_by(id: params['person_id'])
        obj.save!
        personal_request = [obj]
      end
    end
    
    all_requests = Request.where('weekend >= :from AND weekend <= :to', {
      from: params[:from],
      to: params[:to]
    }).order(weekend: :desc)
    
    all_people = Person.all
    ready_list_indices = {}
    all_people.each do | person | 
      ready_list_indices[person['id']] = person.ready_list.map { | bhajan | bhajan.id }
    end

    
    obj = {
      'personal_request': personal_request,
      'requests': all_requests,
      'bhajans': Bhajan.all.as_json,
      'people': all_people,
      'ready_list': ready_list_indices
    }
    
    render :json =>  obj
  end


  def attendance
    ActiveRecord::Base.logger = nil
    if request.post?
      changes = params['changes']

      changes.each do | weekendStr, allDateValues |
        allDateValues.each do | personStr, delta |

          date = Date.parse(weekendStr)
          person = Person.find_by(name: personStr)
          
          request_obj = Request.find_by(person: person, weekend: date)
          if request_obj.blank?
            request_obj = Request.new
            request_obj.person = person
            request_obj.weekend = date
          end
          
          if delta.has_key? 'attended_practice'
            request_obj.attended_practice = delta['attended_practice']
          end
    
          if delta.has_key? 'attended_satsang'
            request_obj.attended_satsang = delta['attended_satsang']
          end
          
          request_obj.save!
        end
      end


      head :ok
      return
    end

    event = Event.find_by(name: params[:event])
    
    attendance_summary = {}
    
    requests = Request.all
    date = nil
    requests.each do | request_obj |
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



    Person.all.each do | person | 
      if !attendance_summary[date].key? person.name
        attendance_summary[date][person.name] = nil
      end
    end
    

      
    render :json => {
      'attendance_summary': attendance_summary,
      'events': Event.all,
      'people': Person.all,
    }
  end
end
