Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "cuisines#index"
  # Routes for the Name resource:

  # CREATE
  get("/names/new", { :controller => "names", :action => "new_form" })
  post("/create_name", { :controller => "names", :action => "create_row" })

  # READ
  get("/names", { :controller => "names", :action => "index" })
  get("/names/:id_to_display", { :controller => "names", :action => "show" })

  # UPDATE
  get("/names/:prefill_with_id/edit", { :controller => "names", :action => "edit_form" })
  post("/update_name/:id_to_modify", { :controller => "names", :action => "update_row" })

  # DELETE
  get("/delete_name/:id_to_remove", { :controller => "names", :action => "destroy_row" })

  #------------------------------

  # Routes for the Venue resource:

  # CREATE
  get("/venues/new", { :controller => "venues", :action => "new_form" })
  post("/create_venue", { :controller => "venues", :action => "create_row" })
  post("/create_venue_from_name", { :controller => "venues", :action => "create_row_from_name" })

  # READ
  get("/venues", { :controller => "venues", :action => "index" })
  get("/venues/:id_to_display", { :controller => "venues", :action => "show" })

  # UPDATE
  get("/venues/:prefill_with_id/edit", { :controller => "venues", :action => "edit_form" })
  post("/update_venue/:id_to_modify", { :controller => "venues", :action => "update_row" })

  # DELETE
  get("/delete_venue/:id_to_remove", { :controller => "venues", :action => "destroy_row" })
  get("/delete_venue_from_neighborhood/:id_to_remove", { :controller => "venues", :action => "destroy_row_from_neighborhood" })

  #------------------------------

  # Routes for the Top pick resource:

  # CREATE
  get("/top_picks/new", { :controller => "top_picks", :action => "new_form" })
  post("/create_top_pick", { :controller => "top_picks", :action => "create_row" })
  post("/create_top_pick_from_venue", { :controller => "top_picks", :action => "create_row_from_venue" })
  post("/create_top_pick_from_dish", { :controller => "top_picks", :action => "create_row_from_dish" })

  # READ
  get("/top_picks", { :controller => "top_picks", :action => "index" })
  get("/top_picks/:id_to_display", { :controller => "top_picks", :action => "show" })

  # UPDATE
  get("/top_picks/:prefill_with_id/edit", { :controller => "top_picks", :action => "edit_form" })
  post("/update_top_pick/:id_to_modify", { :controller => "top_picks", :action => "update_row" })

  # DELETE
  get("/delete_top_pick/:id_to_remove", { :controller => "top_picks", :action => "destroy_row" })
  get("/delete_top_pick_from_venue/:id_to_remove", { :controller => "top_picks", :action => "destroy_row_from_venue" })
  get("/delete_top_pick_from_user/:id_to_remove", { :controller => "top_picks", :action => "destroy_row_from_user" })
  get("/delete_top_pick_from_dish/:id_to_remove", { :controller => "top_picks", :action => "destroy_row_from_dish" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # Routes for the Dish resource:

  # CREATE
  get("/dishes/new", { :controller => "dishes", :action => "new_form" })
  post("/create_dish", { :controller => "dishes", :action => "create_row" })
  post("/create_dish_from_cuisine", { :controller => "dishes", :action => "create_row_from_cuisine" })

  # READ
  get("/dishes", { :controller => "dishes", :action => "index" })
  get("/dishes/:id_to_display", { :controller => "dishes", :action => "show" })

  # UPDATE
  get("/dishes/:prefill_with_id/edit", { :controller => "dishes", :action => "edit_form" })
  post("/update_dish/:id_to_modify", { :controller => "dishes", :action => "update_row" })

  # DELETE
  get("/delete_dish/:id_to_remove", { :controller => "dishes", :action => "destroy_row" })
  get("/delete_dish_from_cuisine/:id_to_remove", { :controller => "dishes", :action => "destroy_row_from_cuisine" })

  #------------------------------

  # Routes for the Cuisine resource:

  # CREATE
  get("/cuisines/new", { :controller => "cuisines", :action => "new_form" })
  post("/create_cuisine", { :controller => "cuisines", :action => "create_row" })

  # READ
  get("/cuisines", { :controller => "cuisines", :action => "index" })
  get("/cuisines/:id_to_display", { :controller => "cuisines", :action => "show" })

  # UPDATE
  get("/cuisines/:prefill_with_id/edit", { :controller => "cuisines", :action => "edit_form" })
  post("/update_cuisine/:id_to_modify", { :controller => "cuisines", :action => "update_row" })

  # DELETE
  get("/delete_cuisine/:id_to_remove", { :controller => "cuisines", :action => "destroy_row" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
