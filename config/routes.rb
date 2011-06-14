M1Scamper::Application.routes.draw do 
  devise_for :users
  resources :users

  resources :locations, :collection => { :indextree => :get }

  resources :employgrades

  resources :staffemployschemes

  resources :staffclassifications

  resources :staffserveschemes

  resources :staffgrades

  resources :staff_serviceschemes

  resources :trainingrequests

  resources :timetable_week_days

  resources :staffcourses

  resources :grades

  match '/time_table_entries/timetable_view', :to => 'time_table_entries#timetable_view'
  resources :time_table_entries

  resources :period_timings

  resources :intakes

  resources :klasses

  resources :suppliers

  resources :suppliers

  resources :usesupplies

  resources :addsupplies

  resources :supplies
 
  match '/assettracks/register', :to => 'assettracks#register'
  resources :assettracks

  resources :roles

  resources :roles

  resources :roles

  resources :courseevaluations

  resources :programmes

  resources :librarytransactions
  
  match '/leaveforstaffs/approve1', :to => 'leaveforstaffs#approve1'
  match '/leaveforstaffs/approve2', :to => 'leaveforstaffs#approve2'
  resources :leaveforstaffs

  resources :staffgrades

  resources :topics

  resources :subjects

  match '/leaveforstudents/approve', :to => 'leaveforstaffs#approve'
  resources :leaveforstudents

  resources :courses

  resources :travelclaims

  resources :appraisals

  resources :appraisals

  resources :disposals

  resources :travelrequests

  resources :examquestions

  resources :assetlosses

  resources :counsellings

  resources :sdiciplines

  resources :bulletins

  resources :news

  resources :parts

  resources :trainneeds

  resources :strainings

  resources :evactivities

  resources :appraisals

  resources :curriculums

  resources :curriculums

  resources :docs

  resources :documents

  resources :curriculums
  
  match '/attendances/approve', :to => 'attendances#approve'
  resources :attendances

  resources :loans

  resources :addbooks

  resources :maints

  resources :assetnums
  
  match '/assets/registerinventory', :to => 'assets#registerinventory'
  resources :assets

  resources :books

  match '/residences/addasset', :to => 'residences#addasset'
  resources :residences

  match '/students/formforstudent', :to => 'students#formforstudent'
  resources :students

  match '/position/maklumat_perjawatan_LA', :to => 'positions#maklumat_perjawatan_LA'
  resources :positions

  resources :cofiles

  resources :documents

  resources :events

  resources :titles

  resources :stafftitles
  
  match '/staffs/reportforstaff', :to => 'staffs#reportforstaff'
  resources :staffs
  
  match '/logout', :to => 'sessions#destroy', :as => 'logout'  
  match '/login', :to => 'sessions#new', :as => 'login'
  match '/register', :to => 'users#create', :as => 'register'
  match '/signup', :to => 'users#new', :as => 'signup'

  resources :users

  resource :session

  resources :pages
  
  match ':name', :to => 'viewer#show' 
  
 # devise_for :users

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  #root :controller => "viewer", :action => 'show', :name => 'home'
  
  root :to => 'viewer#show'

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
#  map.connect ':controller/:action/:id'
#  map.connect ':controller/:action/:id.:format'
  
  match '/:controller(/:action(/:id))'
  
  match ':controller(/:action(/:id(.:format)))'
end
