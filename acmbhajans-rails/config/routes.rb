Rails.application.routes.draw do
  get 'group/attended'
  get 'group/bhajans'

  post 'bhajans/edit'
  get 'bhajans/edit'
  get 'bhajans/dummy_database'

  post 'raga/edit'
  get 'raga/edit'
  
  post 'deity/edit'
  get 'deity/edit'

  post 'weekend/edit'
  get 'weekend/edit'

  post 'language/edit'
  get 'language/edit'

  post 'event/edit'
  get 'event/edit'

  get 'person/dummy'
  get 'person/edit'
  post 'person/edit'

  get 'renditions/edit'
  post 'renditions/edit'
  
  get 'individual/graduated'

  get 'individual/request'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
