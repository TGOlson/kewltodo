Todos::Application.routes.draw do

  resources :todos, except: [:show]

  resources :lists
end
