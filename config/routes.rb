Agentrock::Application.routes.draw do |map|






	

  resources :notifications

  namespace :pages do resources :privacy_policies end

  resources :messages

  namespace :pages do resources :dynamic_pages end

  resources :discussions

  namespace :admin do resources :articles end
	
  resources :activities
  
  get 'how-it-works' => 'pages/how_it_works#index', :as => :how_it_works   
  get 'features' => 'pages/features#index', :as => :features   
  get 'privacy-policy' => 'pages/privacy_policies#index', :as => :privacy_policy   
  get 'terms-conditions' => 'pages/terms_conditions#index', :as => :terms_conditions   
  get 'sitemap' => 'pages/sitemap#index', :as => :sitemap   




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
  
 	constraints(Subdomain) do
 		match '/' => 'subdomains#show'
 	end
  root :to => "accounts#index"

	get 'articles/' => 'admin/articles#index'
	get 'articles/:title/' => 'admin/articles#show'
	
  devise_for :user, :controllers => { :registrations => 'users' }, :skip => [:sessions, :registration] do
	  scope :controller => 'devise/sessions', :as => :user_session do
	    get  :new,     :path => 'login'
	    post :create,  :path => 'login', :as => ""
	    get  :destroy, :path => 'logout'
	  end
	  resource :user, :only => [:edit, :update, :destroy], :as => :user_registration, :controller => 'users'
	  scope :controller => 'users', :as => :user_registration do
	    get  :new,     :path => 'signup', :as => "new"
	    post :create,  :path => 'signup', :as => ""
	  end
    get "forgot", :to => "devise/passwords#new"
    match '/:name' => 'users#show'
		match ':name/account' => 'users#edit', :as => :settings
	  match '/:name/watch' => 'users#watch'
	  match '/:name/unwatch' => 'users#unwatch'
	end	
	
	devise_for :admin
	
	devise_for :affiliate, :controllers => { :registrations => 'affiliates' }, :skip => [:sessions, :registration] do
	  scope :controller => 'devise/sessions', :as => :affiliate_session do
	    get  :new,     :path => 'login'
	    post :create,  :path => 'login', :as => ""
	    get  :destroy, :path => 'logout'
	  end
	  resource :affiliate, :only => [:edit, :update, :destroy], :as => :affiliate_registration, :controller => 'affiliates'
	    get "forgot", :to => "devise/passwords#new"
      get "affiliate/dashboard" => 'affiliates#index', :as => :affiliate_root
      get "affiliates/show"
	  scope :controller => 'affiliates', :as => :affiliate_registration do
	    get  :new,     :path => 'affiliate/signup', :as => "new"
	    post :create,  :path => 'affiliate/signup', :as => ""
	  end
	end	
	


end