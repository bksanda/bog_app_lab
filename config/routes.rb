Rails.application.routes.draw do
  #using error controller
  # get 'errors/file_not_found'

  # get 'errors/unprocessable'

  # get 'errors/internal_server_error'
  #=====

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'creatures#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  resources :creatures # if not update or destroy don't comment out --->, except: [:update,:destroy]  #=== "this is the way we should do it in real life" -Anil

  # get '*path' => redirect('/404.html')
  get '*path', to: "application#not_found"

  # get 'creatures' => 'creatures#index'
  # get 'creatures/new' => 'creatures#new'
  # get 'creatures/:id' => 'creatures#show'
  # post 'creatures/new' => 'creatures#create'

  #rake routes reveal below routes
#    Prefix Verb URI Pattern                   Controller#Action
#          root GET  /                             creatures#index
#     creatures GET  /creatures(.:format)          creatures#index
#               POST /creatures(.:format)          creatures#create
#  new_creature GET  /creatures/new(.:format)      creatures#new
# edit_creature GET  /creatures/:id/edit(.:format) creatures#edit
#      creature GET  /creatures/:id(.:format)      creatures#show


  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  #using error controller
  # match '/404', to: 'errors#file_not_found', via: :all
  # match '/422', to: 'errors#unprocessable', via: :all
  # match '/500', to: 'errors#internal_server_error', via: :all

end
