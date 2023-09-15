Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :output_reports
  resources :posts do
   resource :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
 
  resources :users, only: :show
end
