Rails.application.routes.draw do
  devise_for :users, :controllers  => {
             :registrations => 'users/registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "home#index"

  post "/get_started" =>"home#get_started", as: "get_started"
end
