class DogsController < ApplicationController
  load_and_authorize_resource
  before_action :load_categories, only: [:index, :new, :edit]
  before_action :load_data, only: :show
  before_action :authenticate_user!, except: [:index, :show]

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

  def show
  end

  def new
  end

  def create
    @dog = current_user.dogs.build dogs_params
    if @dog.save
      flash[:success] = t "dogs.created"
      redirect_to dogs_path
    else
      load_categories
      render :new
    end
  end

  def edit
  end

  def update
    if @dog.update_attributes dogs_params
      flash[:success] = t "dogs.updated"
      redirect_to dogs_path
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
    redirect_to dogs_path
  end

  private
  def dogs_params
    params.require(:dog).permit :name, :weight, :height, :origin, :category_id,
      :description, :avg_life_expectancy, :image
  end

  def load_categories
    @categories = Category.all.collect {|category| [category.name, category.id]}
  end

  def load_data
    @dog = Dog.includes(:reviews).find_by id: params[:id]
    @review = Review.new
  end
end
