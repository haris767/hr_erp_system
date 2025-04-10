Rails.application.routes.draw do
  resources :employees
  devise_for :users
  root "employees#index"
 resources :dashboard
end
