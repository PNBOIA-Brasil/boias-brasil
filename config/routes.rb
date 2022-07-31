Rails.application.routes.draw do
  # get '/messages/new', to: 'messages#new'
  # post '/messages', to: 'messages#create'
  devise_for :users
  root to: 'pages#home'

  get 'programation', to: 'pages#programation'
  get 'pages/about', to: 'pages#about', as: "about"

  controller :pages do
    get :qr_code_generator
    get :qr_code_download
  end

end
