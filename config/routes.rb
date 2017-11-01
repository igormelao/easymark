Rails.application.routes.draw do
  get 'stores/index'

  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'
  get  "/stores", to: "stores#index"
end
