Rails.application.routes.draw do
  root 'welcome/home', controller: "welcome", action: "home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do 
    resources :users
  end
end
