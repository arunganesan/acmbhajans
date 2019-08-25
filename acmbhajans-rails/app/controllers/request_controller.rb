class RequestController < ApplicationController
  require "time"
  skip_before_action :verify_authenticity_token

  def edit
    if request.post?
      puts params

      if params['id'] == ''
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

    all_people = Person.all

    ready_list_indices = {}
    all_people.each do | person | 
      ready_list_indices[person['id']] = person.ready_list.map { | bhajan | bhajan.id }
    end


    render :json => {
      'contents': Request.all,
      'bhajans': Bhajan.all.as_json,
      'people': all_people,
      'ready_list': ready_list_indices
    }
  end
end
