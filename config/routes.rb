MagicTv::Application.routes.draw do

  resource :import, only: [:new, :create]


  resources :programs
  root :to => 'programs#index'


  resources :users

end
