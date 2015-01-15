Rails.application.routes.draw do

  #using error controller
  # get 'errors/file_not_found'

  # get 'errors/unprocessable'

  # get 'errors/internal_server_error'
  #=====

  root 'creatures#index'

  resources :creatures # if not update or destroy don't comment out --->, except: [:update,:destroy]  #=== "this is the way we should do it in real life" -Anil

  get "creatures/tag/:tag" => "creatures#tag", as: :tagc

  resources :tags


  # get '*path' => redirect('/404.html')
  get '*path', to: "application#not_found"



  #using error controller
  # match '/404', to: 'errors#file_not_found', via: :all
  # match '/422', to: 'errors#unprocessable', via: :all
  # match '/500', to: 'errors#internal_server_error', via: :all

end
