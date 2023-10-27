
  Rails.application.routes.draw do
    get 'homes/index'
    devise_for :users
    
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    root "homes#index"
    get '/about_us', to: 'homes#about_us'
    get '/terms_and_conditions', to: 'homes#terms_and_conditions'
    get '/users/sign_out' => 'devise/sessions#destroy'
  
    resources :cars do
        resources :comments, only: [:create]  # Esto crea una ruta para añadir comentarios a un coche
        resources :rentals, only: [:create] 
      member do
        post '/cars/:id/rent', to: 'cars#rent', as: :rent_car
        post '/cars/:id/comments', to: 'cars#add_comment', as: :car_comments
      end
    end
  end
  