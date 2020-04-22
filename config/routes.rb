Rails.application.routes.draw do
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get 'how-search-works', to: 'static_pages#searchexplain'
  root 'beads#index'
  get '/beads', to: redirect("/")
  resources :beads
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
