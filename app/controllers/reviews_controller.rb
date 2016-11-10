class ReviewsController < ApplicationController
  load_and_authorize_resource

  def create
    if @review.save
      flash[:success] = "Successfully reviewed..."
    else
      flash[:danger] = "Not reviewed..."
    end
    redirect_to @review.dog
  end

  def edit
    @dog = @review.dog
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    if @review.update_attributes review_params
      flash[:success] = "Successfully reviewed..."
    else
      flash[:danger] = "Not reviewed..."
    end
    redirect_to @review.dog
  end

  def destroy
    dog = @review.dog
    if @review.destroy
      flash[:success] = "Successfully destroyed..."
    else
      flash[:danger] = "Not destroyed..."
    end
    redirect_to dog
  end

  private
  def review_params
    params.require(:review).permit :content, :rate, :dog_id, :user_id
  end
end
