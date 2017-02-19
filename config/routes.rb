Rails.application.routes.draw do
  resources :candidates do
    resources :resumes
  end
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'homes#index'
end
