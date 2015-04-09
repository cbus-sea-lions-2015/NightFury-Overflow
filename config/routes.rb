Rails.application.routes.draw do

  resource :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:index, :new, :create]
  resource :profile, except: [:new, :create], controller: "users"
  resources :answers

  # resources :answers

  resources :comments, except: [:show]

  root to: 'users#index'

  # resources :users, except: [:show]
  # get '/profile' => "users#show"

  # get '/users' => "users#index"
  # get '/users/new' => "users#new"
  # post '/users' => "users#create"


  # get '/profile' => "users#show"
  # get '/profile/edit' => "users#edit"
  # put '/profile' => "users#update"
  # delete '/profile' => "users#destroy"



>>>>>>> 657bad6e1542bebbf1b32085d16d7598e25bb145

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
