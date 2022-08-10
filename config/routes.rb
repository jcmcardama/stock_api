Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations"
  }
  namespace :api, path: '/' do
    resources :stocks
  end
end
