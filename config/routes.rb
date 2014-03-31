TutoringApp::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  resources :students
  resources :tutors

  # just the three routes we need
  get  "/session/new"  => "session#new"
  post "/session"      => "session#create"
  get  "/logout"       => "session#destroy"

#       Prefix Verb   URI Pattern                      Controller#Action
#             root GET    /                                welcome#index
#         students GET    /students(.:format)              students#index
#                  POST   /students(.:format)              students#create
#      new_student GET    /students/new(.:format)          students#new
#     edit_student GET    /students/:id/edit(.:format)     students#edit
#          student GET    /students/:id(.:format)          students#show
#                  PATCH  /students/:id(.:format)          students#update
#                  PUT    /students/:id(.:format)          students#update
#                  DELETE /students/:id(.:format)          students#destroy
#           tutors GET    /tutors(.:format)                tutors#index
#                  POST   /tutors(.:format)                tutors#create
#        new_tutor GET    /tutors/new(.:format)            tutors#new
#       edit_tutor GET    /tutors/:id/edit(.:format)       tutors#edit
#            tutor GET    /tutors/:id(.:format)            tutors#show
#                  PATCH  /tutors/:id(.:format)            tutors#update
#                  PUT    /tutors/:id(.:format)            tutors#update
#                  DELETE /tutors/:id(.:format)            tutors#destroy
#     appointments GET    /appointments(.:format)          appointments#index
#                  POST   /appointments(.:format)          appointments#create
#  new_appointment GET    /appointments/new(.:format)      appointments#new
# edit_appointment GET    /appointments/:id/edit(.:format) appointments#edit
#      appointment GET    /appointments/:id(.:format)      appointments#show
#                  PATCH  /appointments/:id(.:format)      appointments#update
#                  PUT    /appointments/:id(.:format)      appointments#update
#                  DELETE /appointments/:id(.:format)      appointments#destroy
#      session_new GET    /session/new(.:format)           session#new
#          session POST   /session(.:format)               session#create
#           logout GET    /logout(.:format)                session#destroy



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
