Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "vehicles#index"
  # Routes for the Loan resource:
  # CREATE
  get "/loans/new", :controller => "loans", :action => "new"
  post "/create_loan", :controller => "loans", :action => "create"

  # READ
  get "/loans", :controller => "loans", :action => "index"
  get "/loans/:id", :controller => "loans", :action => "show"

  # UPDATE
  get "/loans/:id/edit", :controller => "loans", :action => "edit"
  post "/update_loan/:id", :controller => "loans", :action => "update"

  # DELETE
  get "/delete_loan/:id", :controller => "loans", :action => "destroy"
  #------------------------------

  # Routes for the Resident_parking_permit resource:
  # CREATE
  get "/resident_parking_permits/new", :controller => "resident_parking_permits", :action => "new"
  post "/create_resident_parking_permit", :controller => "resident_parking_permits", :action => "create"

  # READ
  get "/parking_permits", :controller => "resident_parking_permits", :action => "index"
  get "/resident_parking_permits/:id", :controller => "resident_parking_permits", :action => "show"

  # UPDATE
  get "/resident_parking_permits/:id/edit", :controller => "resident_parking_permits", :action => "edit"
  post "/update_resident_parking_permit/:id", :controller => "resident_parking_permits", :action => "update"

  # DELETE
  get "/delete_resident_parking_permit/:id", :controller => "resident_parking_permits", :action => "destroy"
  #------------------------------

  # Routes for the Visitor_parking_permit resource:
  # CREATE
  get "/visitor_parking_permits/new", :controller => "visitor_parking_permits", :action => "new"
  post "/create_visitor_parking_permit", :controller => "visitor_parking_permits", :action => "create"

  # READ
  get "/parking_permits", :controller => "visitor_parking_permits", :action => "index"
  get "/visitor_parking_permits/:id", :controller => "visitor_parking_permits", :action => "show"

  # UPDATE
  get "/visitor_parking_permits/:id/edit", :controller => "visitor_parking_permits", :action => "edit"
  post "/update_visitor_parking_permit/:id", :controller => "visitor_parking_permits", :action => "update"

  # DELETE
  get "/delete_visitor_parking_permit/:id", :controller => "visitor_parking_permits", :action => "destroy"
  #------------------------------

  # Routes for the Vehicle resource:
  # CREATE
  get "/vehicles/new", :controller => "vehicles", :action => "new"
  post "/create_vehicle", :controller => "vehicles", :action => "create"

  # READ
  get "/vehicles", :controller => "vehicles", :action => "index"
  get "/vehicles/:id", :controller => "vehicles", :action => "show"

  # UPDATE
  get "/vehicles/:id/edit", :controller => "vehicles", :action => "edit"
  post "/update_vehicle/:id", :controller => "vehicles", :action => "update"

  # DELETE
  get "/delete_vehicle/:id", :controller => "vehicles", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
