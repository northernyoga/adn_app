AdnApp::Application.routes.draw do

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :eval_tests
  resources :exercises
  resources :evaluations
  resources :programmes
  resources :equipes
  resources :equipe_types
  resources :resultats do
      post 'prise_donnees', on: :collection
      get  'index_detail', on: :collection
      get  'athlete', on: :collection
      get  'programme_corrective', on: :collection
  end


  root to: 'static_pages#home'

  match '/inscription',  to: 'users#new'
  match '/ouverture',  to: 'sessions#new'
  match '/fermeture', to: 'sessions#destroy', via: :delete
  match '/decouvrir',    to: 'static_pages#decouvrir'
  match '/avantages',   to: 'static_pages#avantages'
  match '/ouverture', to: 'static_pages#ouverture'
  match '/dashboard', to: 'adn#dashboard'
  match '/do_login', to: 'adn#do_login'
  match '/nouveau_test', to: 'eval_tests#new'
  match '/modifier_test', to: 'eval_tests#edit'
  match '/nouvelle_exercise', to: 'exercises#new'
  match '/modifier_exercise', to: 'exercises#edit'
  match '/nouvelle_evaluation', to: 'evaluations#new'
  match '/modifier_evaluation', to: 'evaluations#edit'
  match '/nouveau_programme', to: 'programmes#new'
  match '/modifier_programme', to: 'programmes#edit'
  match '/nouvelle_equipe', to: 'equipes#new'
  match '/modifier_equipe', to: 'equipes#edit'
  match '/evaluation_athlete', to: 'resultats#new_athlete'
  match '/evaluation_equipe', to: 'resultats#new_team'
  match '/modifier_resultat', to: 'resultats#edit'
  match '/nouveau_resultat', to: 'resultats#new'

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
