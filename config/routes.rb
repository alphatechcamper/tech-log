Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts do
    collection do
      get 'search'
    end
  end
  resources :type1_posts, controller: 'posts', type: 'Type1' # Type 1 投稿
  resources :type2_posts, controller: 'posts', type: 'Type2' # Type 2 投稿
  resources :type3_posts, controller: 'posts', type: 'Type3' # Type 3 投稿
  resources :type4_posts, controller: 'posts', type: 'Type4' # Type 4 投稿

  resources :users, only: :show
end
