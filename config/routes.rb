Rails.application.routes.draw do
  get '/about', to: 'static_pages#about'
  get 'how-search-works', to: 'static_pages#searchexplain'
  root 'beads#index'
  get '/beads', to: redirect("/")
  resources :beads

  # https://stackoverflow.com/a/18080494
  resources :contact_forms, path: "contact", as: :contact_forms
end
