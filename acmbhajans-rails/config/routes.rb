Rails.application.routes.draw do
  get 'group/attended'
  get 'group/bhajans'

  post 'bhajans/edit'
  get 'bhajans/edit'

  get 'bhajans/dummy_database'
  get 'bhajans/import_migration'

  post 'raga/edit'
  get 'raga/edit'

  post 'deity/edit'
  get 'deity/edit'

  post 'request/edit'
  get 'request/edit'

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
  get 'renditions/summarize'
  
  get 'individual/graduated'
  get 'individual/request'
end
