Agentrock::Application.routes.draw do |map|
  

  devise_for :users, :skip => [:sessions, :passwords, :confirmations, :registrations]
  
  get 'login' => 'devise/sessions#new', :as => :new_user_session
  post 'login' => 'devise/sessions#create', :as => :user_session
  get 'logout' => 'devise/sessions#destroy', :as => :destroy_user_session
  
  post 'Oops!-I-Forgot!(.:format)' => 'devise/passwords#create'
  put 'Oops!-I-Forgot!(.:format)' => 'devise/passwords#update', :as => :user_password
  get 'Oops!-I-Forgot!(.:format)' => 'devise/passwords#new', :as => :new_user_password
  get 'Oops!-I-Forgot!(.:format)' => 'devise/passwords#edit', :as => :edit_user_password    

  post 'signup(.:format)' => 'devise/registrations#create'
  put 'signup(.:format)' => 'devise/registrations#update'
  delete 'signup(.:format)' => 'devise/registrations#destroy', :as => :user_registration
  get 'signup(.:format)' => 'devise/registrations#new', :as => :new_user_registration
  get 'signup(.:format)' => 'devise/registrations#edit', :as => :edit_user_registration        

  get 'confirm(.:format)' => 'devise/confirmations#show'
  post 'confirm(.:format)' => 'devise/confirmations#create', :as => :user_confirmation  
  get 'confirm(.:format)' => 'devise/confirmations#new', :as => :new_user_confirmation

  match ':email' => 'users#show', :as => :profile 
  #   match ':username/settings' => 'users#edit', :as => :settings
  #   match 'register/:activation_code', :to => 'activations#new', :as => :register, :conditions => { :method => :get }, :activation_code => nil
  #   match 'activate/:id' => 'activations#create', :as => :activate#, :conditions => { :method => :post }
  # match 'browse' => 'accounts#index', :as => :browse
  #   resources :roles
  # resource :user, :only => [:show, :create, :edit, :update]
  #   resources :users, :has_one => :account
  # resources :pics
  root :to => 'users#index'
  # match ':username/upload-pic' => 'pics#new', :as => :upload_pic
  # match ':username' => 'accounts#show', :as => :user_home
  # match ':username/edit' => 'accounts#edit', :as => :dashboard

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

end
