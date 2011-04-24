Agentrock::Application.routes.draw do

  resources :profiles

  resources :notifications

  namespace :pages do resources :privacy_policies end

  resources :messages

  namespace :pages do resources :dynamic_pages end

  resources :discussions

  namespace :admin do resources :articles end
	
  resources :activities
  
  get 'how' => 'pages/how_it_works#index', :as => :how
  get 'buzz' => 'pages/buzz#index', :as => :buzz
  get 'features' => 'pages/features#index', :as => :features   
  get 'privacy' => 'pages/privacy_policies#index', :as => :privacy
  get 'terms' => 'pages/terms_conditions#index', :as => :terms
  get 'sitemap' => 'pages/sitemap#index', :as => :sitemap   
  
 	constraints(Subdomain) do
 		match '/' => 'subdomains#show'
 	end
	
	constraints(Facebook) do
		match "/facebook/" => "facebooks#index"
		match 'facebook/welcome' => 'facebooks/welcomes#index'
	end

	get 'blog/' => 'admin/articles#index'
	get 'articles/:title/' => 'admin/articles#show'
	
  devise_for :user, :controllers => { :registrations => 'users/registrations', :sessions => 'users/sessions' }, :skip => [:sessions, :registration, :passwords] do
    root :to => "home#index"
    get 'login' => 'users/sessions#new', :as => :new_user_session
    post 'login' => 'users/sessions#create', :as => :user_session
    get 'logout' => 'users/sessions#destroy', :as => :destroy_user_session

    get 'signup' => 'users/registrations#new', :as => :new_user_registration
    post 'signup' => 'users/registrations#create', :as => :user_registration
    
    # scope :controller => 'users', :as => :oauth_callback do
    #       get  :auth,     :path => 'user/auth/facebook/callback', :as => "new"
    #       post :deauth,  :path => 'user/de-auth/facebook/callback', :as => "de"
    #     end
    get "forgot", :to => "devise/passwords#new", :as => :user_password
    
    # match ':name/settings' => 'users#edit', :as => :settings
    # get ':name/edit' => 'accounts#edit', :as => :edit_account_details   
    # post ':name/edit' => 'accounts#update'    
    #     match ':name/watch' => 'users#watch'
    #     match ':name/unwatch' => 'users#unwatch'
    #     get '/upload/songs' => 'accounts#new', :as => :upload_songs
    #     post '/upload/songs' => 'accounts#create', :as => ""
    # get 'browse' => 'users#index'
    #     match ':name' => 'accounts#show', :as => :user
    
        get 'your/account' => 'users/registrations#edit', :as => :edit_user_registration
        put 'your/account' => 'users/registrations#update', :as => :user_registration
        get 'your/account/self-destruct' => 'users/registrations#destroy', :as => :destroy_user_registration
    #     get 'your/account/purchases' => 'users/purchases#index', :as => :purchases
    #     get 'your/account/feedback' => 'users/feedbacks#index', :as => :account_feedback
        # get 'your/profile' => 'accounts#show', :as => :user_profile
        get 'your/account/profile' => 'accounts#edit', :as => :edit_user_profile
        put 'your/account/profile' => 'accounts#update', :as => :edit_user
    #     get 'your/account/profile/update_college_select/:state_abbr' => 'accounts#update_college_select'
    #     
    #     get "forgot", :to => "devise/passwords#new", :as => :new_user_password
    #     get 'users/auth/:action/callback/' => 'oauth_callbacks#facebook', :as => :oauth_authorize
    # 
    #     post 'users/auth/facebook/callback/deauthorize/' => 'users/oauth_callbacks#facebook_deauthorize'
        get ':path' => 'accounts#show', :as => :user_profile
    # 
    # get 'payments/new', :as => :new_payment
    # get 'paypal/referer' => 'payments#referer', :as => :paypal_referer
    # get 'paypal/callback' => 'payments#callback', :as => :paypal_callback
    # get 'paypal/cancel' => 'payments#cancel', :as => :paypal_cancel
	end	
	  resources :accounts     
    devise_for :admin
  # 
  # devise_for :affiliate, :controllers => { :registrations => 'affiliates' }, :skip => [:sessions, :registration] do
  #   scope :controller => 'devise/sessions', :as => :affiliate_session do
  #     get  :new,     :path => 'login'
  #     post :create,  :path => 'login', :as => ""
  #     get  :destroy, :path => 'logout'
  #   end
  #   resource :affiliate, :only => [:edit, :update, :destroy], :as => :affiliate_registration, :controller => 'affiliates'
  #     get "forgot", :to => "devise/passwords#new"
  #       get "affiliate/dashboard" => 'affiliates#index', :as => :affiliate_root
  #       get "affiliates/show"
  #   scope :controller => 'affiliates', :as => :affiliate_registration do
  #     get  :new,     :path => 'affiliate/signup', :as => "new"
  #     post :create,  :path => 'affiliate/signup', :as => ""
  #   end
  # end 
	


end