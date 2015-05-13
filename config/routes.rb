Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'cities#index'

  get 'test' => 'cities#test'
  get 'test_my_cities_index' => 'cities#test_my_cities_index'
  get 'test_my_city_index' => 'attractions#test_my_city_index'
  get 'test_my_attraction_map' => 'attractions#test_my_attraction_map'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  get 'mycities' => 'cities#my_cities_index'
  get 'mycities/:city_id' => 'cities#my_cities_show'
  get 'mycities/:city_id/attractions' => 'attractions#my_attractions_index'
  get 'mycities/:city_id/attractions/:id/maps' => 'attractions#my_attractions_maps'
  get 'mycities/:city_id/attractions/:id' => 'attractions#my_attractions_show'
  get 'mycities/:city_id/selected_map' => 'attractions#my_selected_map'
  get 'auth/:provider/callback' => 'sessions#fbcreate'
  get 'auth/failure', to: redirect('/')
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  resources :cities do
    resources :attractions do
      member do
        post 'like'
        post 'dislike'
      end
    end
  end

  resources :users do
    resources :cities do
      resources :attractions
    end
  end

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
