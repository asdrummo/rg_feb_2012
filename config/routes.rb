Drummlins::Application.routes.draw do

  namespace :components do resources :saddles, :pedals, :grips, :half_links, :chains, :chainrings, :cranks, :bottom_brackets, :rear_brakes, :front_brakes, :rear_tubes, :rear_tires, :cogs, :front_tubes, :front_tires, :rim_strips, :rear_wheels, :front_wheels, :headsets, :forks, :front_levers, :rear_levers, :handlebars, :stems, :seat_clamps, :forks, :seat_posts end

  resources :accessories, :component_packages, :frame_models, :workshops, :customers, :users
  
  root :to => 'public#index'
  match 'payments/confirm' => 'payments#confirm', :as => :confirm_payment
  match 'payments/new', :to => 'payments#new', :as => :new_payment 
  match '/', :to => 'public#index'
  match 'workshops', :to => 'public#workshops'
  match 'do_it_yourself', :to => 'public#do_it_yourself'
  match 'bamboo_bike_kits', :to => 'public#bamboo_bike_kits'
  match 'admin', :to => 'admin#menu', :as => :admin_menu
  match 'admin_menu', :to => 'admin#menu'
  match 'logout' => 'admin#logout', :as => :logout
  match 'admin/components' => 'admin#components', :as => :components_menu
  match 'bikes_to_buy' => 'public#bikes_to_buy'
  match 'show_components' => 'public#show_components'
  match 'customers/:id/edit_info' => 'customers#edit_info', :as => :edit_info
  match 'customers/:id/edit_login' => 'customers#edit_login', :as => :edit_login
  match 'customers/:id/show' => 'customers#show_customer', :as => :show_customer
  match 'public/do_it_yourself' => 'public#do_it_yourself', :as => :do_it_yourself
  match 'public/show_components' => 'public#show_components', :as => :show_components
  match 'component_packages/:id/show_component_package' => 'component_packages#show_component_package', :as => :show_component_package
  match 'public/bikes_to_buy' => 'public#bikes_to_buy', :as => :bikes_to_buy
  
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
    #resources :components do
      # resources :comments, :sales
    # resource :seat_posts
  #  end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
   # namespace :components do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
       
     #end
  
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id(.:format)))'

end
