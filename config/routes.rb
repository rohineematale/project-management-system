Task1::Application.routes.draw do

# get 'projects/index' 

  #get 'milestones/index'

  # post 'projects/create'
  # match 'projects'=> 'projects#index',:method=>:get,:as=>"projects"
  # match  'projects/new'=>"projects#new" ,:method=>:get,:as=>"new_projects"
  # match '/projects/create'=>"projects#create",:method=>:post,:as=>"create_projects"

  # match 'projects/:id/edit'=>"projects#edit",:method=>"get",:as=>"edit_project"
  # match 'projects/:id/update'=>"projects#update",:method=>"put",:as=>"update_project"
  # match 'projects/:id'=>"projects#show",:method=>:get,:as=>"project"

  # match 'projects/:id/destroy'=>"projects#destroy",:method=>:delete,:as=>"destroy_project"
  resources :projects do 
    member do
      get "finish_project"
    end
    resources :milestones do
      member do
        get "finish_milestone"
      end
      resources :tasks do
        member do
          get "finish_task"
        end
      end
    end
  end

  resources :users

  root :to => 'projects#index'
###############################For milestone###################################################
#   match "milestones"=>"milestones#index", :as=>"milestones"
#   #match "milestones/index"=>"milestones#index", :as=> "milestone"

#   match "milestones/new"=>"milestones#new", :method=>:get, :as=>"new_milestone"
#   match "/milestones/create"=>"milestones#create",:method=>:post,:as=>"create_milestones"

#   match "/milestones/:id/edit"=>"milestones#edit", :method=>:get, :as=>"edit_milestone"
#   match "milestones/:id/update"=>"milestones#update",:method=>:put,:as=>"update_milestone"

#   match "/milestones/:id"=>"milestones#show", :method=>:get, :as=>"show_milestone"

#   match 'milestones/:id/destroy'=>"milestones#destroy",:method=>:delete,:as=>"destroy_milestone"
# ###################################Milestone end###############################################
 


# ###################################For Task####################################################
# match "task"=>"task#index", :as=>"task"

# match "task/new"=>"task#new", :method=>:get, :as=>"new_task"
# match "task/create"=>"task#create", :method=>:post, :as=>"create_task"

# match "task/:id/edit"=>"task#edit", :method=>:get, :as=>"edit_task"
# match "task/:id/update"=>"task#update", :method=>:put, :as=>"update_task"

# match "task/:id"=>"task#show", :method=>:get, :as=>"show_task"

# match "task/:id/destroy"=>"task#destroy", :metho=>:delete, :as=>"destroy_task"

# ###################################Task end####################################################
 


# ###################################For User####################################################
# match "user"=>"user#index", :as=>"user"

# match "user/new"=>"user#new", :method=>:get, :as=>"new_user"
# match "user/create"=>"user#create", :method=>:post, :as=>"create_user"

# match "user/:id/edit"=>"user#edit", :method=>:get, :as=>"edit_user"
# match "user/:id/update"=>"user#update", :method=>:put, :as=>"update_user"

# match "user/:id"=>"user#show", :method=>:get, :as=>"show_user"

# match "user/:id/destroy"=>"user#destroy", :metho=>:delete, :as=>"destroy_user"

###################################User end####################################################

  # The priority is based upon order of creation
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
