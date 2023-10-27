Rails.application.routes.draw do
  get 'homes/index'
  devise_for :users
  resources :cars
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homes#index"
  get '/about_us', to: 'homes#about_us'
  get '/terms_and_conditions', to: 'homes#terms_and_conditions'
  get '/users/sign_out' => 'devise/sessions#destroy'

end
