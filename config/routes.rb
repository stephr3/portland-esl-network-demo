Rails.application.routes.draw do
  root to: "sites#index"
  get "/about" => "pages#about"
  get "/volunteer" => "pages#volunteer"
  get "/learning" => "links#learning"
  get "/real-world" => "volunteer_sites#index"
  get "/teaching" => "links#teaching"
  get "/refugees" => "links#refugees"
  get "/" => "sites#index"
  get '/log-in' => 'sessions#new'
  post '/log-in' => 'sessions#create'
  get '/log-out' => 'sessions#destroy', as: :log_out
  get '/admin' => 'pages#admin'
  get '/admin/sites' => 'sites#admin'
  get '/admin/sites/new' => 'sites#new'
  delete 'admin/sites' => 'sites#destroy'
  get 'admin/sites/edit' => 'sites#edit'
  patch 'admin/sites' => 'sites#update'

  resources :posts
  resources :links
end
