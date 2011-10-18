Pollinate::Application.routes.draw do
    # The priority is based upon order of creation:
    # first created -> highest priority.
    root :to => 'pages#homenew'
    match	'home',					:to => 'pages#home', :as => 'mobile_home'
    match	'homenew',					:to => 'pages#homenew'
    match 'geturl', :to => 'pages#geturl'

    match	'begin',					:to => 'pages#begin'

    match	'experiment',					:to => 'pages#experiment'
    match	'mapper',					:to => 'pages#mapper'
    match 'dashboard/:token', :to => "presentations#dashboard"

    resources :presentations do

        member do
            get 'results'
        end

        resources :questions do
            post 'enable'
            get 'chart'
            resources :answers
        end
    end


    # Sample of regular route:

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
    # root :to => "welcome#index"

    # See how all your routes lay out with "rake routes"

    # This is a legacy wild controller route that's not recommended for RESTful applications.
    # Note: This route will make all actions in every controller accessible via GET requests.
    # match ':controller(/:action(/:id(.:format)))'
end
