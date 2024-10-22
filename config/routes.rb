Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
 # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
   root to: "users#index"

   resources :users, only:[:index, :show, :new, :create, :destroy] do
   resources :tasks, only:[:index, :show, :new, :create, :update, :destroy] 
   end
  #  post '/users/user/create', to: 'user#create', as: 'create_user'
    post '/users/:user_id/tasks', to: 'tasks#create', as: 'create_task'
end
