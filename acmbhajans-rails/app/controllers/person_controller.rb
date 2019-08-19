class PersonController < ApplicationController
  skip_before_action :verify_authenticity_token

  def edit
    if request.post?
      # if params['id'] == ''
      #   event = Event.new  
      # else
      #   event = Event.find_by(id: params['id'])
      # end
      # event.name = params['name']
      # event.save
    end


    render :json => {
      'contents': Person.all,
      'bhajans': Bhajan.all,
    }
  end
end
