Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/:provider/callback' => 'session#create'
  delete '/logout' => 'session#destroy'

  resources :retirements

  resources :events do
    resources :tickets
  end
end
