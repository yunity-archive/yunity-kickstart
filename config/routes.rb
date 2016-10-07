Rails.application.routes.draw do
  resources :sharers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sharers#landing'
end
