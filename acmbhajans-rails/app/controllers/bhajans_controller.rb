class BhajansController < ApplicationController
    skip_before_action :verify_authenticity_token


  def edit
    if request.post?
    #   if params['id'] == ''
    #     raga = Raga.new  
    #   else
    #     raga = Raga.find_by(id: params['id'])
    #   end
    end

    
    @contents = Bhajan.all.order(id: :desc)
    @unique_ragas = Raga.all

    render :json => {
      'contents': @contents,
      'ragas': @unique_ragas,
    }
  end
end
