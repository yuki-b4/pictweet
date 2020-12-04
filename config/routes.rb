Rails.application.routes.draw do
  devise_for :users    #ターミナルにて、[rails g devise モデル名]の実行で、自動入力。ユーザーに必要なルーティングを全て整備。しゅご。
  root to: 'tweets#index'   #localhost:3000にアクセスした時、index処理が行われるための記述。
  resources :tweets do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  # only: [:index, :new, :create, :destroy, :edit, :update, :show]の記述は、resourcesのデフォで設定されているので、無駄！
  resources :users, only: :show
  
end
