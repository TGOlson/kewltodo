Todos::Application.routes.draw do

  resources :todos, except: [:show]
end
