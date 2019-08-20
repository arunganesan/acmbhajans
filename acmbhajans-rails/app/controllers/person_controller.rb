class PersonController < ApplicationController
  skip_before_action :verify_authenticity_token

  def dummy
    person = Person.new  
    person.name = 'Abra'
    person.phone = '1234'
    person.email = 'abra@kadabra'
    person.ready_list.delete_all

    
    person.ready_list << Bhajan.find_by(id: 2)
    person.ready_list << Bhajan.find_by(id: 1)
    person.save


    render :json => {
      'contents': Person.all,
      'bhajans': Bhajan.all,
    }
  end

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
      'ready_list': ready_list_indices,
      'bhajans': Bhajan.all.as_json,
    }
  end
end
