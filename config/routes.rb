Mercerie::Application.routes.draw do


  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :deliveries
  resources :site

  resources :addresses

  resources :orders

  resources :cart_items

  resources :carts
  # resources :carts do
  #   collection do
  #     post :add_to_cart, :on => :member
  #   end
  # end
  match 'carts/add_to_cart', :to => 'carts#add_to_cart', :as => "add_to_cart", :method => :post
  match 'carts/remove_from_cart/:id', :to => 'carts#remove_from_cart', :as => "remove_from_cart", :method => :get
 # match 'carts/add_order', :to => 'orders#create', :as => "create"
 
    resources :users, :user_sessions
    match 'login' => 'user_sessions#new', :as => :login
    match 'logout' => 'user_sessions#destroy', :as => :logout
    match 'carts/index/:id',:to => 'carts#index', :as => :index
    
    
    
resources :products

	
	
resources :categories do
	resources :products
end	


   		
	

  
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => "site#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  


end
