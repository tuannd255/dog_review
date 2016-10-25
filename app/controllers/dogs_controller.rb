class DogsController < ApplicationController
  authorize_resource
  before_action :load_categories, only: :index
  before_action :load_data, only: :show

  def index
    @dogs = Category.first.dogs
  end

  def show
  end

  private
  def load_categories
    @categories = Category.all.collect {|category| [category.name, category.id]}
  end

  def load_data
    @dog = Dog.includes(:reviews).find_by id: params[:id]
    @review = current_user.reviews.build dog_id: @dog.id
  end
end
