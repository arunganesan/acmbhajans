class BhajansController < ApplicationController
    skip_before_action :verify_authenticity_token


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
      bhajan.save
    end

    
    render :json => {
      'contents': Bhajan.all.order(id: :desc),
      'ragas': Raga.all,
      'deities': Deity.all,
      'languages': Language.all,
    }
  end
end
