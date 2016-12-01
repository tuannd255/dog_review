class Admin::DogsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_categories, only: [:index, :edit, :new]
  load_and_authorize_resource

  def index
    @filter_dogs = ["name", "weight", "height"]
    @dogs = if params[:commit].present?
      Dog.search params[:search_dog], params[:search]
    else
      @dogs
    end
    @dogs = @dogs.page params[:page]
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
  end

  def create
    @dog = current_user.dogs.build dogs_params
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
    @review = Review.new
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
    if @dog.destroy
      flash[:success] = "Successfully deleted..."
    else
      flash[:danger] = "Not deleted..."
    end
    redirect_to admin_dogs_path
  end

  private
  def dogs_params
    params.require(:dog).permit :name, :weight, :height, :origin, :category_id,
      :description, :avg_life_expectancy, :image
  end

  def load_categories
    @categories = Category.all.collect {|category| [category.name, category.id]}
  end
end
