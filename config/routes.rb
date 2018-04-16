Rails.application.routes.draw do
  devise_for :users
  root "tweets#index"   #ルートパスの設定
    resources :tweets
  get "users/:id" => "users#show"   #mypageへのルーティング
  # パスの一部をコントローラにパラメーターというハッシュ形式で値を送る事ができます。
  # コントローラ内でparams[:id]と記述することにすれば
  # /users/:idの:id部分の情報を使用することができます。
  # ->『application.haml』内の『"/users/#{current_user.id}"』からバリューを取得している

  # ※下記の様に『/:id』を『/:user_id』と変更すると、キーが変更される。
  # get "users/:user_id" => "users#show"   #mypageへのルーティング


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
