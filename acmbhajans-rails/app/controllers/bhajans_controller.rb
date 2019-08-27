class BhajansController < ApplicationController
    require "time"
    skip_before_action :verify_authenticity_token

  def import_migration
    
    render :json => {
      'contents': Bhajan.all.order(id: :desc),
      'ragas': Raga.all,
      'deities': Deity.all,
      'languages': Language.all,
    }
  end
  
  def dummy_database
    for i in 1..10 do
      Language.create(:name => "Language #{i}")
      Raga.create(:name =>"Raga #{i}")
      Deity.create(:name => "Deity #{i}")
      Person.create(:name => "Person #{i}", :coordinator => true)
      Bhajan.create(:name => "Bhajan #{i}")
      Event.create(:name => "Event #{i}")
    end
    
    render :json => {
      'contents': Person.all,
      'bhajans': Bhajan.all,
  }  
  end

  def edit
    if request.post?
      if params['id'] == ''
        bhajan = Bhajan.new  
      else
        bhajan = Bhajan.find_by(id: params['id'])
      end

      bhajan.name = params['name']
      bhajan.beat = params['beat']
      bhajan.speed = params['speed']
      bhajan.raga_id = params['raga_id']
      bhajan.deity_id = params['deity_id']
      bhajan.language_id = params['language_id']
      bhajan.save!
    end

    
    render :json => {
      'bhajans': Bhajan.all.order(name: :asc),
      # 'ragas': Raga.all,
      # 'deities': Deity.all,
      # 'languages': Language.all,
    }
  end
end
