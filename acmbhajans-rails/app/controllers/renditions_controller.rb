class RenditionsController < ApplicationController
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
        person.ready_list.delete_all
        params['ready_list'].each do |bhajan_id| 
          person.ready_list << Bhajan.find_by(id: bhajan_id)
        end
        
        person.save
      end
  
  
      all_persons = Person.all
      ready_list_indices = {}
      all_persons.each do | person | 
        ready_list_indices[person['id']] = person.ready_list.map { | bhajan | bhajan.id }
      end
  
      render :json => {
        'contents': all_persons,
        
        # reference into the bhajan/event
        'bhajans': Bhajan.all,
        'events': Event.all,

        # unique list
        'lead_list': ready_list_indices,
        'backup_list': ready_list_indices,
        'instrumentalists_list': ready_list_indices,
        'soundsystem_list': ready_list_indices,
        
        # index into above lists
        'people': Person.all,
        
      }
    end
  end
