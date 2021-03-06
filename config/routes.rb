Rails.application.routes.draw do
  # デバイスのルーティング
  devise_for :users

  # トップページビュー表示のルーティング
  root to: 'items#index'

  # /itemsのパスに対応するルーティング
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :orders, only: [:index, :create]
  end
end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
