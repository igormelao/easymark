Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'

  resources :stores
  patch "/stores/:id_store/marks/:id/daily_marks", to: "marks#update_daily_marks", as: :update_daily_marks

  resources :marks, except: [:new, :edit]
  get "/marks/:id_store/new", to: "marks#new"
  get "/marks/:id_store/edit/:id", to: "marks#edit"

end
