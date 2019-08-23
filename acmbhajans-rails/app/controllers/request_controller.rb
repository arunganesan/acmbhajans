class RequestController < ApplicationController
  skip_before_action :verify_authenticity_token

  def edit
    if request.post?
      if params['id'] == ''
        request_obj = Request.new  
      else
        request_obj = Request.find_by(id: params['id'])
      end

      request_obj.will_attend_practice = params['will_attend_practice']
      request_obj.will_attend_satsang = params['will_attend_practice']
      request_obj.attended_practice = params['attended_practice']
      request_obj.attended_satsang = params['attended_satsang']

      request_obj.weekend = Weekend.find_by(id: params['weekend_id'])
      request_obj.person = Person.find_by(id: params['person_id'])
      request_obj.save!
    end

    render :json => {
      'contents': Request.all,
      'bhajans': Bhajan.all.as_json,
      'people': Person.all.as_json,
      'weekends': Weekend.all.as_json,
    }
  end
end
