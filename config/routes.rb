Rails.application.routes.draw do
  devise_for :users
  root to: "message#index"
  post 'message/new' => 'message#index'
  resources :message, only: [:index, :new, :create]
end
