Rails.application.routes.draw do
  #devise_for :users

  get '/'=>'home#top'
  get 'home/member'


  
  get 'user/mongene' =>'user#mongene'
  get 'user/mymongene' 
  post 'user/create' => 'user#create'
  get "user/signup_email_sended"
  get "user/authenticate_completed"
  get "user/mongene_created"
  get 'user/:id'=> 'user#individual'

  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_for :users, :controllers => {
    :registrations => "users/registrations", 
    :confirmations => "users/confirmations"
  }
end


