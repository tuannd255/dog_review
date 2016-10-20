class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = @categories.includes :dogs
  end

  def new
  end

  def create
    if @category.save
      flash[:success] = t "categories.created"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @category.update_attributes categories_params
      flash[:success] = t "categories.updated"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t "categories.deleted"
    else
      flash[:danger] = t "categories.not_delete"
    end
    redirect_to admin_categories_path
  end

  private
  def categories_params
    params.require(:category).permit :name
  end
end
