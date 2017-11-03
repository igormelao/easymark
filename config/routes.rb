Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'
  resources :stores
  resources :marks, except: [:new, :edit]
  get "/marks/:id_store/new", to: "marks#new"
  get "/marks/:id_store/edit/:id", to: "marks#edit"
end
