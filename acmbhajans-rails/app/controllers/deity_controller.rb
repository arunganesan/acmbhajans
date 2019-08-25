class DeityController < ApplicationController
  skip_before_action :verify_authenticity_token


  def edit
    if request.post?
      if params['id'] == ''
        deity = Deity.new  
      else
        deity = Deity.find_by(id: params['id'])
      end
      deity.name = params['name']
      deity.save!
    end

    render :json => {
      'deities': Deity.all.order(id: :desc)
    }
  end
end
