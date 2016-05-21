Rails.application.routes.draw do
  resources :tweets, param: :name, only: :show
  resources :twitter_users, param: :name, only: :show

  get '/', to: redirect('/tweets/casetabs')
end
