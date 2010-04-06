Agentrock::Application.routes.draw do |map|
  devise_for :users
  
  #   resource :user_session, :only => [:create]
  #   match 'login' => 'user_sessions#new'#, :conditions => { :method => :get }
  #   match 'logout' => 'user_sessions#destroy'#, :conditions => { :method => [:get, :delete] }
  #   match ':screen_name/settings' => 'users#edit', :as => :settings
  #   match 'Oops!-I-Forgot!' => 'password_resets#new', :as => :forgot#, :conditions => { :method => :get }
  #   resources :password_resets, :only => [:new, :edit, :create, :update]
  # 
  #   match 'signup' => 'users#new', :as => :signup#, :conditions => { :method => :get }
  # match 'confirm' => 'activations#show'
  #   match 'register/:activation_code', :to => 'activations#new', :as => :register, :conditions => { :method => :get }, :activation_code => nil
  #   match 'activate/:id' => 'activations#create', :as => :activate#, :conditions => { :method => :post }
  # match 'browse' => 'accounts#index', :as => :browse
  #   resources :roles
  # resource :user, :only => [:show, :create, :edit, :update]
  #   resources :users, :has_one => :account
  # resources :pics
  #   root :to => 'home#index'
  # match ':screen_name/upload-pic' => 'pics#new', :as => :upload_pic
  # match ':screen_name' => 'accounts#show', :as => :user_home
  # match ':screen_name/edit' => 'accounts#edit', :as => :dashboard

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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
