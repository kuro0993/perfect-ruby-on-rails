Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/:provider/callback' => 'session#create'
  delete '/logout' => 'session#destroy'
  get 'status' => 'status#index', defaults: { format: 'json' }

  resources :retirements

  resources :events do
    resources :tickets
  end

  match '*path' => 'application#error404', via: :all
end
