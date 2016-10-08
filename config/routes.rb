Rails.application.routes.draw do
  devise_for :admins
  resources :sharers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sharers#landing'
  get 'signup_confirmation' => 'sharers#signup_confirmation'
end
