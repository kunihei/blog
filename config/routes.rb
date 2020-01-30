Rails.application.routes.draw do
  resources :plans do
    collection do
      get 'list_index'
    end
  end
  devise_for :users,
   controllers: { registrations: 'users/registrations' }
  root to: "plans#index"
end
