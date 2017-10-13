Rails.application.routes.draw do
	post '/matched', to: 'matches#create', as: "perfect_match"
  resources :messages
  resources :playdates
  resources :matches
  resources :swipes
  resources :pets
  resources :users

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/', to: 'sessions#index', as: 'root'
  post '/users/new', to: 'users#create'
  post '/pets/:id/edit', to: 'pets#update'
  get '/pets/:id/edit', to: 'pets#edit'
  delete '/pets/:id/delete', to: 'pets#destroy', as: 'delete'
  get '/pets/:id/delete', to: 'pets#destroy'
  get '/messages/:id/delete', to: 'messages#destroy'
  post '/users/:id/edit', to: 'users#update'
  delete 'messages/:id/delete', to: 'messages#destroy', as: 'delete_message'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  get '/users/:id/delete', to: 'users#destroy'
  delete '/users/:id/delete', to: 'users#destroy', as: 'delete_user'
  post '/pets/new', to: 'pets#create'
  post '/messages/new', to: 'messages#create'
  get '/testimonials', to: 'static#testimonials', as: 'testimonial'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
