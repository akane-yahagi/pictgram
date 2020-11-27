Rails.application.routes.draw do
  
  get 'sessions/new'
  
  root 'pages#index'
  get 'pages/help'
  
  #UserリソースはUserモデルを介してDB上の永続的データにアクセスする
  #Sessionリソースはcokkiesを保存場所として使う
  #↓ sessionsリソースの追加。formはnewアクションで処理。
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users
  resources :topics
  resources :comments

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
  
  
  
end
