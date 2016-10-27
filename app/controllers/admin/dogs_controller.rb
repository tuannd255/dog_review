class Admin::DogsController < ApplicationController
  before_action :load_categories, only: [:index, :edit, :new]
  load_and_authorize_resource

  def index
    @dogs = Category.first.dogs if Category.first
  end

  def new
  end

  def create
    if @dog.save
      flash[:success] = t "dogs.created"
      redirect_to admin_dogs_path
    else
      load_categories
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @dog.update_attributes dogs_params
      flash[:success] = t "dogs.updated"
      redirect_to admin_dogs_path
    else
      load_categories
      render :edit
    end
  end

  def destroy
  end

  private
  def dogs_params
    params.require(:dog).permit :name, :width, :height, :origin, :category_id,
      {images: []}
  end

  def load_categories
    @categories = Category.all.collect {|category| [category.name, category.id]}
  end
end
