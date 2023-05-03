Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      put '/stocks/restock', to: 'stocks#restock'
      put '/stocks/update', to: 'stocks#update'
      resources :products, only: [:index, :create, :destroy, :update, :show]
      resources :stocks, only: [:index, :create, :destroy, :show]
      resources :stores, only: [:index, :create, :destroy, :update, :show]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
