Rails.application.routes.draw do
  get '/about', to: 'static_pages#about'
  root 'beads#index'
  get '/beads', to: redirect("/")
  resources :beads
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
