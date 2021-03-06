Rails.application.routes.draw do

  get 'comments/create'
  get 'comments/destroy'
  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#new_guest'
  end

  get 'homes/top'
  root to: 'homes#top'

  scope module: :public do

    get 'users/log_out_confirm'
    get '/search', to: 'searchs#search'
    get 'category' => 'posts#category'


    resources :posts, only:[:new, :create, :index, :show, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
    end

    resources :posts, except: [:index] do
      resources :comments, only: [:create, :destroy]
    end

    resources :users, only:[:index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      get 'favorites' => 'users#favorites'

       # 退会確認画面
      get 'unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
       # 論理削除用のルーティング
      patch 'withdrawal' => 'users#withdrawal', as: 'withdrawal'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
