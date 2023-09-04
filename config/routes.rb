Rails.application.routes.draw do
  #this creates a root_url
  root 'application#home'

  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/contact'
end
