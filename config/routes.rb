Rails.application.routes.draw do
  # Get only 5 stars restaurants
  get('/restaurants/top', { to: "restaurants#top" })

  # Get a restaurants' chef
  get '/restaurants/:id/chef', to: "restaurants#chef"

  resources :restaurants do
    # GET /restaurants/:restaurant_id/reviews
    # GET /restaurants/:restaurant_id/reviews/new
    # POST /restaurants/:restaurant_id/reviews
    resources :reviews, only: [:index, :new, :create]

    # You could also do this here:

    # get '/chef', to: "restaurants#chef"
    # collection do
    #   # get '/top', to: "restaurants#top"
    # end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

