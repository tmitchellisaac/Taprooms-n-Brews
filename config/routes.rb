Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "welcome#index"

  get "/taprooms/new", to: "taprooms#new"
  get "/taprooms", to: "taprooms#index"
  get "/taprooms/:id", to: "taprooms#show"
  get "/taprooms/:id/edit", to: "taprooms#edit"
  patch '/taprooms/:id', to: 'taprooms#update'
  post "/taprooms", to: "taprooms#create"
  delete "/taprooms/:id", to: "taprooms#destroy"

  get "/beers", to: "beers#index"
  get "/beers/:id", to: "beers#show"
  get "/beers/:beer_id/edit", to: "beers#edit"
  patch "/beers/:beer_id", to: "beers#update"
  delete "/beers/:id", to: "beers#destroy"

  get "/taprooms/:taproom_id/beers/new", to: "taproom_beers#new"
  post "/taprooms/:taproom_id/beers", to: "taproom_beers#create"
  get "/taprooms/:taproom_id/beers", to: "taproom_beers#index"
  get "/taprooms/:taproom_id/beers/:sort_code" ,to: "taproom_beers#index"


end
