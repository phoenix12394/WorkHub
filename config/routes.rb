SampleApp::Application.routes.draw do



  match '/contact', :to => 'pages#contact'
  match '/help', :to => 'pages#help'

  match '/about', :to => 'pages#about'
  match '/signup', :to => 'users#new'
  match '/signin', :to => 'sessions#new'
#  match '/signout', :to => 'sessions#destroy'
match "/auth/:provider/callback" => "sessions#createauto"
match "/signout" => "sessions#destroy", :as => :signout  
  match '/newlocation', :to => 'locations#new'
  match '/newcategory', :to => 'categories#new'
  
  get '/microposts/new', :to => 'microposts#new'
  #root :to => "microposts#new"
  #get '/newpost', :to => 'microposts#new'
  resources :users,   :has_many => [:tags], :member => {:tags => :get, :tag_add => :post, :tag_remove => :post}
  resources :locations
  resources :categories
  resources :tags, :memeber => {:roll => :get}, :has_many => [:users, :microposts]
  get 'microposts/autocomplete_tag_name'

  
  resources :sessions, :only=> [:new, :create, :destroy]
  resources :microposts, :only=>[:create, :destroy, :show], :has_many => [:tags], :member => {:tags => :get, :tag_add => :post, :tag_remove => :post}
  resources :users do
    get 'tags', :on => :member
    member do
      post 'tag_add'
      post 'tag_remove'
    end
  end
  
  resources :microposts do
    get 'tags', :on => :member
    member do
      post 'tag_add'
      post 'tag_remove'
    end
  end

  resources :tags do
    get 'roll', :on => :member
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
   root :to => "pages#home"
  # See how all yours routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
