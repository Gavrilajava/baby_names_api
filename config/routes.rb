Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/list', to: 'lists#create'
  get '/lists/:list', to: 'lists#show'
  post '/names', to: 'names#create'
  get '/names/:list', to: 'names#index'
  patch '/name', to: 'names#update'
  

  
end
