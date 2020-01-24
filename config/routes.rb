Rails.application.routes.draw do
  resources :plans do
    collection do
      get 'list_index'
    end
  end

  devise_for :users
  root to: "plans#index"
  resources :messages, only: [:index, :new, :create]
end
