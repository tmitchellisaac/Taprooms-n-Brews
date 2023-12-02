Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "welcome#index"

  get "taprooms/new", to: "taprooms#new"
  post "taprooms", to: "taprooms#create"

  get "/taprooms", to: "taprooms#index"
  get "/taprooms/:id", to: "taprooms#show"
  get "/taprooms/:id/edit", to: "taprooms#edit"
  patch '/taprooms/:id', to: 'taprooms#update'
  get "/beers", to: "beers#index"
  get "/beers/:id", to: "beers#show"
  
  get "/taprooms/:taproom_id/beers", to: "taproom_beers#index"

end
