class TopPicksController < ApplicationController
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

  def edit_form
    @top_pick = TopPick.find(params.fetch("prefill_with_id"))

    render("top_pick_templates/edit_form.html.erb")
  end

  def update_row
    @top_pick = TopPick.find(params.fetch("id_to_modify"))

    @top_pick.venue_id = params.fetch("venue_id")
    @top_pick.dish_id = params.fetch("dish_id")
    @top_pick.user_id = params.fetch("user_id")

    if @top_pick.valid?
      @top_pick.save

      redirect_to("/top_picks/#{@top_pick.id}", :notice => "Top pick updated successfully.")
    else
      render("top_pick_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @top_pick = TopPick.find(params.fetch("id_to_remove"))

    @top_pick.destroy

    redirect_to("/top_picks", :notice => "Top pick deleted successfully.")
  end
end
