Agentrock::Application.routes.draw do |map|


	devise_for :users, :controllers => { :registrations => 'users' }
	
	as :user do 
		get 'login' => 'devise/sessions#new'
		get 'logout' => 'devise/sessions#destroy'
		get 'signup' => 'users#new'
	  get 'forgot' => 'devise/passwords#new'
    match '/:name' => 'users#show'
	end
	
  resources :activities
  
#   match '/activate/:activation_code' => 'users#activate'
  
  resources :users
  
#  match 'articles' => Rack::Jekyll.new()



#  match '/:name/watch' => 'users#watch'
#  match '/:name/unwatch' => 'users#unwatch'  
  
   #match '/how-it-works' => render("how")

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
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
  #       get :recent, :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  


	constraints(Subdomain) do
		match '/' => 'subdomains#show'
	end
  root :to => "accounts#index"
end