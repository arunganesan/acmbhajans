class WeekendController < ApplicationController
  skip_before_action :verify_authenticity_token


  def edit
    if request.post?
      if params['id'] == ''
        weekend = Weekend.new  
      else
        weekend = Weekend.find_by(id: params['id'])
      end
      weekend.name = params['name']
      weekend.save!
    end

    render :json => {
      'contents': Weekend.all.order(id: :desc)
    }
  end
end
