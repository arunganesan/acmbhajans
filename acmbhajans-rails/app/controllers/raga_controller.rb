class RagaController < ApplicationController
  skip_before_action :verify_authenticity_token


  def edit
    if request.post?
      if params['id'] == ''
        raga = Raga.new  
      else
        raga = Raga.find_by(id: params['id'])
      end

      raga.name = params['name']
      raga.arohanam = params['arohanam']
      raga.avarohanam = params['avarohanam']
      raga.anyasvara = params['anyasvara']
      raga.save!
    end
    
    render :json => {
      'contents':Raga.all.order(id: :desc)
    }
  end
end
