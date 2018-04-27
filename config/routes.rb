Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "welcome#index"
  

  resources :emails
  resources :postulants do
  	resources :emails
  end
end
