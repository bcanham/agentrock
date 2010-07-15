Agentrock::Application.routes.draw do |map|


  resources :discussions

  resources :articles
	
  resources :activities   

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
  
	devise_for :users, :skip => [:registrations, :sessions], :controllers => { :registrations => 'users' } do 
		get 'login' => 'devise/sessions#new'
		get 'logout' => 'devise/sessions#destroy'
	  get 'forgot' => 'devise/passwords#new'
	  resource :user, :only => [:index, :show]  	
    match '/:name' => 'users#show'
    match '/:name/watch' => 'users#watch'
  	match '/:name/unwatch' => 'users#unwatch'  
	end
	


 	constraints(Subdomain) do
 		match '/' => 'subdomains#show'
 	end
  root :to => "accounts#index"
end