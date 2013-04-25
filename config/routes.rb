MagicTv::Application.routes.draw do

  resources :programs do
    get :mail, format: true, default: {format: :text}, on: :collection
    member do
      put "moderate/:status", action: :moderate, as: :moderate
    end
  end

  resource :import, only: [:new, :create]

  resource :user do
    get :help
    get :resend_activation
    get "activate/:key", action: :activate, as: :activate
    get "unsubscribe/:key", action: :unsubscribe, as: :unsubscribe
  end
  match "/auth/:provider/callback" => "users#omniauth"

  match "session/destroy"

  root :to => 'programs#index'
end
