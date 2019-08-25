class LanguageController < ApplicationController
  skip_before_action :verify_authenticity_token


  def edit
    if request.post?
      if params['id'] == ''
        language = Language.new  
      else
        language = Language.find_by(id: params['id'])
      end
      language.name = params['name']
      language.save!
    end
    
    render :json => {
      'languages': Language.all.order(id: :desc)
    }
  end
end
