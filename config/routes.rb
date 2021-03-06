Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/weather', to: 'weather#index'
      get '/backgrounds', to: 'backgrounds#index'
      get '/book-search', to: 'book_search#index'
      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#create'
      post '/trip', to: 'trip#create'
    end
  end
end
