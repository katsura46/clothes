Rails.application.routes.draw do

  get 'relationships/followings'
  get 'relationships/followers'
  
  
  
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }


  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  get 'homes/top'
  root to: 'homes#top'

  scope module: :public do
    
    get 'users/log_out_confirm'
    resources :clothes, only:[:new, :create, :index, :show, :edit, :update, :destroy]
    post 'clothes/:clothe_id/favorites' => 'favorites#create'
    resources :clothes do
      resource :favorites, only: [:create, :destroy]
    end
    resources :users, only:[:index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
  end
  

  namespace :admin do

    resources :genres, only:[:index, :edit, :create, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
