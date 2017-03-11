Rails.application.routes.draw do
  resources :companies do
    resources :hiring_managers
    resources :roles
  end
  resources :candidates
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'homes#index'
end
