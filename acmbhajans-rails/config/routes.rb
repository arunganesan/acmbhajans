Rails.application.routes.draw do
  get 'group/attended'
  get 'group/bhajans'
  
  get 'raga/edit'
  get 'person/edit'
  get 'renditions/edit'


  get 'individual/graduated'

  get 'individual/request'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
