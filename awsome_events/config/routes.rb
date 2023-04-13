Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/:provider/callback' => 'session#create'
  delete '/logout' => 'session#destroy'
  get 'status' => 'status#index', defaults: { format: 'json' }

  resources :retirements, only: %i[new create]

  resources :events, only: %i[new create show edit update destroy] do
    resources :tickets, only: %i[new create destroy]
  end

  match '*path' => 'application#error404', via: :all
end
