Rails.application.routes.draw do

  #Backbone:
  root to: 'static_pages#root'

  namespace :api, defaults: { format: :json } do
    resources :products
    resources :users
    resources :categories
    resources :brands
    resources :likes, only: [:create, :destroy, :index]
    resources :follows, only: [:create, :destroy, :index]
    resources :feed
    resources :comments, only: [:create, :destroy, :index]
  end

  #Rails:
  #root to: 'products#index'

  resources :users, except: [:index]

  resources :products

  resources :brands, only: [:create, :destroy, :index, :show]
  resources :categories, only: [:create, :destroy, :index, :show]

  resource :session, only: [:new, :create, :destroy]

  resources :comments, only: [:create, :destroy]

  resources :collections, only: [:create, :destroy]

  # post 'like' => 'likes#create', as: :like
#   post 'unlike' => 'likes#destroy', as: :unlike

  post 'follow' => 'follows#create', as: :follow
  post 'unfollow' => 'follows#destroy', as: :unfollow

  ########

  #get 'products/categories', :to => 'products#categories'

  #root 'products/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

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
end
