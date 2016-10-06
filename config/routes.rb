Rails.application.routes.draw do
  root to: "sites#index"
  get "/about" => "pages#about"
  get "/volunteer" => "pages#volunteer"
  get "/learning" => "links#learning"
  get "/real-world" => "volunteer_sites#index"
  get "/teaching" => "links#teaching"
  get "/refugees" => "links#refugees"
  get "/" => "sites#index"

  resources :posts
  resources :links
end
