Rails.application.routes.draw do
  get 'sessions/new'
  
  root 'pages#index'
  get 'pages/help'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  
  #UserリソースはUserモデルを介してDB上の永続的データにアクセスする
  #Sessionリソースはcokkiesを保存場所として使う
  #↓ sessionsリソースの追加。formはnewアクションで処理。
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
