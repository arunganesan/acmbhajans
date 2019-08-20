class RenditionsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def edit
      if request.post?
        if params['id'] == ''
          rendition = Rendition.new  
        else
          rendition = Rendition.find_by(id: params['id'])
        end
  
        rendition.date = params['date']
        rendition.recording_url = params['recording_url']
        rendition.shruti = params['shruti']
        rendition.bhajan = Bhajan.find_by(id: params['bhajan_id'])
        rendition.event = Event.find_by(id: params['event_id'])
        
        lead_list = params['lead']
        rendition.lead.delete_all
        params['lead'].each do |person_id| 
          rendition.lead << Person.find_by(id: person_id)
        end
        
        rendition.save
      end
      
      lead_list_indices = {}
      backup_list_indices = {}
      instrumentalists_list_indices = {}
      soundsystem_list_indices = {}

      all_renditions = Rendition.all
      all_renditions.each do | rendition | 
        lead_list_indices[rendition['id']] = rendition.lead.map { | person | person.id }
      end
  
  
      render :json => {
        'contents': all_renditions,
        
        # reference into the bhajan/event
        'bhajans': Bhajan.all,
        'events': Event.all,

        # unique list
        'lead_list': lead_list_indices,
        'backup_list': backup_list_indices,
        'instrumentalists_list': instrumentalists_list_indices,
        'soundsystem_list': soundsystem_list_indices,
        
        # index into above lists
        'people': Person.all,
      }
    end
  end
