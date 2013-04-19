MagicTv::Application.routes.draw do

  match "session/destroy"

  resource :import, only: [:new, :create]


  resources :programs
  root :to => 'programs#index'


  resources :users
  get "/auth/:provider/callback" => "users#create"
end
