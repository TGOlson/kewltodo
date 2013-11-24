Todos::Application.routes.draw do

  root to: 'lists#index'

  resources :lists do
  	resources :todos , shallow: true
  end

#  mount JasmineRails::Engine => "/specs" if defined?(JasmineRails)


end
