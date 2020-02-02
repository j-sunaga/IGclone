Rails.application.routes.draw do

  root to: 'sessions#new'

  resources :pictures do
    collection do
      post :confirm
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  resource :user

  resources :favorites, only: [:create, :destroy]

end
