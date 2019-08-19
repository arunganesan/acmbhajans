class PersonController < ApplicationController
  skip_before_action :verify_authenticity_token

  def edit
    if request.post?
      if params['id'] == ''
        person = Person.new  
      else
        person = Person.find_by(id: params['id'])
      end

      person.name = params['name']
      person.phone = params['phone']
      person.email = params['email']

      ready_list = params['ready_list']
      

      
      ready_list = []
      params['ready_list'].each do |bhajan_id| 
        ready_list << Bhajan.find_by(id: bhajan_id)
      end
      
      person.ready = ready_list
      person.save
    end


    render :json => {
      'contents': Person.all,
      'bhajans': Bhajan.all,
    }
  end
end
