Rails.application.routes.draw do
  resources :companies
  resources :candidates
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'homes#index'
end
