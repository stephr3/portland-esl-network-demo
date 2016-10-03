Rails.application.routes.draw do
  root to: "sites#index"
  get "/about" => "pages#about"
  get "/volunteer" => "pages#volunteer"
  get "/learning" => "links#learning"
  get "/real-world" => "links#real_world"
  get "/teaching" => "links#teaching"
  get "/refugees" => "links#refugees"
  get "/" => "sites#index"
  get "/north-northeast" => "sites#north_northeast"
  get "/south-southeast" => "sites#south_southeast"
  get "/southwest" => "sites#southwest"
  get "/downtown" => "sites#downtown"
  get "/gresham" => "sites#gresham"
  get "/washington-county" => "sites#washington_county"
  get "/clark-county" => "sites#clark_county"
  get "/other-areas" => "sites#other_areas"

  resources :posts
  resources :links
end
