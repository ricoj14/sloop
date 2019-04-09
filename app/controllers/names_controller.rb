class NamesController < ApplicationController
  def index
    @q = Name.ransack(params[:q])
    @names = @q.result(:distinct => true).includes(:venues).page(params[:page]).per(10)

    render("name_templates/index.html.erb")
  end

  def show
    @venue = Venue.new
    @name = Name.find(params.fetch("id_to_display"))

    render("name_templates/show.html.erb")
  end

  def new_form
    @name = Name.new

    render("name_templates/new_form.html.erb")
  end

  def create_row
    @name = Name.new


    if @name.valid?
      @name.save

      redirect_back(:fallback_location => "/names", :notice => "Name created successfully.")
    else
      render("name_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @name = Name.find(params.fetch("prefill_with_id"))

    render("name_templates/edit_form.html.erb")
  end

  def update_row
    @name = Name.find(params.fetch("id_to_modify"))


    if @name.valid?
      @name.save

      redirect_to("/names/#{@name.id}", :notice => "Name updated successfully.")
    else
      render("name_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @name = Name.find(params.fetch("id_to_remove"))

    @name.destroy

    redirect_to("/names", :notice => "Name deleted successfully.")
  end
end
