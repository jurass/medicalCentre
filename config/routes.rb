MedicalCentre::Application.routes.draw do
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
  root :to => 'home#index'

  get "sign_in" => "authentication#sign_in"
  get "signed_out" => "authentication#signed_out"
  get "new_user" => "authentication#new_user"

  post "sign_in" => "authentication#log_in"

  put "new_user" => "authentication#register"




  get "account_settings" => "authentication#account_settings"
  put "account_settings" => "authentication#set_account_info"
  # See how all your routes lay out with "rake routes"


  get "admin_users" => "admin#users"
  delete "user/:id" => "admin#delete_user", :as => "user"

  get "user/:id" => "admin#edit_doctor", :as => "user"
  post "user/:id" => "admin#edit_doctor", :as => "user"
  put "user/:id" => "admin#set_doctor", :ad => "user"



  #put "new_doctor" => "admin#new_doctor"
  get "new_doctor" => "admin#new_doctor"
  post "new_doctor" => "admin#new_doctor"
  put "add_doctor" => "admin#add_doctor"

  get "clinic_doctor" => "admin#doctors"
  post "clinic_doctor" => "admin#doctors"
  put "clinic_doctor" => "admin#clinic_doctor"


  get "user_approval" => "admin#user_approval"
  #put "approve" => "admin#approve"
  #match "tour", to: "admin#approve", :as => "user"
  put "approve_user" => "admin#approve_user"
  match "approve_user", to: "admin#approve_user"


  #put "user/:id" => "admin#approve", :as => "user"

  put "edit_doctor" => "admin#set_doctor"

  get "schedules" => "appointment#schedules"

  get "appointments" => "appointment#appointments"

get "available_appointments" => "appointment#available_appointments"

get "doctors_appointments" => "appointment#doctors_appointments"

  get "patient_appointments" => "appointment#patient_appointments"


  delete "appointment/:id" => "appointment#delete_appointment", :as => "appointment"

  get "app" => "appointment#confirm_appointment"

  #todo: change it!
  get "makeapp" => "appointment#make_an_appointment"


  ##=====================SCHEDULE
  get "new_schedule" => "appointment#new_schedule"
  post "new_schedule" => "appointment#new_schedule"
  put "new_schedule" => "appointment#add_schedule_element_to_schedule"

  delete "schedule_element/:id" => "appointment#delete_schedule_element", :as => "schedule_element"

  get "admin_outpatient_clinic" => "admin#outpatient_clinics"
  delete "outpatient_clinic/:id" => "admin#delete_outpatient_clinic", :as => "outpatient_clinic"

  get "new_outpatient_clinic" => "admin#new_outpatient_clinic"
  put "new_outpatient_clinic"  => "admin#add_outpatient_clinic"




  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

end
