Todos::Application.routes.draw do

  resources :lists do
  	resources :todos , shallow: true
  end

end
