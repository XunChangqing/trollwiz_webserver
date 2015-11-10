Rails.application.routes.draw do
  mount WeixinRailsMiddleware::Engine, at: "/"
  #domain_name apis
  post 'domain_names/update_logs'
  post 'domain_names/submit_tmp_domain_name'

  #wechat apis
  get 'wechat_apis/jssdk_sign_package'
  post 'wechat_apis/access_token'
  post 'wechat_apis/create_scene'
  post 'wechat_apis/scene_info'
  post 'wechat_apis/get_user_info'
  post 'wechat_apis/get_auth_info'
  post 'wechat_apis/error_report'
  get 'wechat_apis/binding'
  get 'wechat_apis/auth'

  #wechat responder
  #resource :wechat, only:[:show, :create]

  scope "/admin" do
    resources :black_domain_names
    resources :white_domain_names
    resources :tmp_domain_names
    resources :domain_update_logs
    resources :error_reports
    end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'white_domain_names#index'

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
