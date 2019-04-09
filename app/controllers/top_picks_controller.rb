class TopPicksController < ApplicationController
  before_action :current_user_must_be_top_pick_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_top_pick_user
    top_pick = TopPick.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == top_pick.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @top_picks = TopPick.all

    render("top_pick_templates/index.html.erb")
  end

  def show
    @top_pick = TopPick.find(params.fetch("id_to_display"))

    render("top_pick_templates/show.html.erb")
  end

  def new_form
    @top_pick = TopPick.new

    render("top_pick_templates/new_form.html.erb")
  end

  def create_row
    @top_pick = TopPick.new

    @top_pick.venue_id = params.fetch("venue_id")
    @top_pick.dish_id = params.fetch("dish_id")
    @top_pick.user_id = params.fetch("user_id")

    if @top_pick.valid?
      @top_pick.save

      redirect_back(:fallback_location => "/top_picks", :notice => "Top pick created successfully.")
    else
      render("top_pick_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_dish
    @top_pick = TopPick.new

    @top_pick.venue_id = params.fetch("venue_id")
    @top_pick.dish_id = params.fetch("dish_id")
    @top_pick.user_id = params.fetch("user_id")

    if @top_pick.valid?
      @top_pick.save

      redirect_to("/dishes/#{@top_pick.dish_id}", notice: "TopPick created successfully.")
    else
      render("top_pick_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_venue
    @top_pick = TopPick.new

    @top_pick.venue_id = params.fetch("venue_id")
    @top_pick.dish_id = params.fetch("dish_id")
    @top_pick.user_id = params.fetch("user_id")

    if @top_pick.valid?
      @top_pick.save

      redirect_to("/venues/#{@top_pick.venue_id}", notice: "TopPick created successfully.")
    else
      render("top_pick_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @top_pick = TopPick.find(params.fetch("prefill_with_id"))

    render("top_pick_templates/edit_form.html.erb")
  end

  def update_row
    @top_pick = TopPick.find(params.fetch("id_to_modify"))

    @top_pick.venue_id = params.fetch("venue_id")
    @top_pick.dish_id = params.fetch("dish_id")
    

    if @top_pick.valid?
      @top_pick.save

      redirect_to("/top_picks/#{@top_pick.id}", :notice => "Top pick updated successfully.")
    else
      render("top_pick_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_dish
    @top_pick = TopPick.find(params.fetch("id_to_remove"))

    @top_pick.destroy

    redirect_to("/dishes/#{@top_pick.dish_id}", notice: "TopPick deleted successfully.")
  end

  def destroy_row_from_user
    @top_pick = TopPick.find(params.fetch("id_to_remove"))

    @top_pick.destroy

    redirect_to("/users/#{@top_pick.user_id}", notice: "TopPick deleted successfully.")
  end

  def destroy_row_from_venue
    @top_pick = TopPick.find(params.fetch("id_to_remove"))

    @top_pick.destroy

    redirect_to("/venues/#{@top_pick.venue_id}", notice: "TopPick deleted successfully.")
  end

  def destroy_row
    @top_pick = TopPick.find(params.fetch("id_to_remove"))

    @top_pick.destroy

    redirect_to("/top_picks", :notice => "Top pick deleted successfully.")
  end
end
