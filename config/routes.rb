Rails.application.routes.draw do
  devise_for :employees,:path => "auth"

  authenticated :employee do
    root 'welcome#index', as: :authenticated_root
  end

  root 'home#index'

  # devise_scope :employee do
  #   root to: 'devise/sessions#new'
  # end

  resources :companies do
    resources :appointments
  end
end
