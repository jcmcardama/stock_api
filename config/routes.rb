Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  devise_for :users
  namespace :api, path: '/' do
    resources :stocks
  end
end
