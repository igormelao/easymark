Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'

  resources :stores
  patch "/daily_marks/:id", to: "marks#update_daily_marks", as: :update_daily_marks

  resources :marks, except: [:new, :edit]
  get "/marks/:id_store/new", to: "marks#new"
  get "/marks/:id_store/edit/:id", to: "marks#edit"

end
