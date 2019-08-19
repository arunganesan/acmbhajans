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
      language.save
    end

    @contents = Language.all.order(id: :desc)

    render :json => {
      'contents': @contents,
    }
  end
end
