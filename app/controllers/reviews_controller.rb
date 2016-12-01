class ReviewsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def create
    rate = 0
    if @review.save
      @review.dog.reviews.each do |review|
        rate += review.rate
      end
      rate_avg = rate / @review.dog.reviews.size
      rate_avg = (rate_avg*2).ceil.to_f / 2
      @review.dog.update_attributes rate: rate_avg
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
    rate = 0
    if @review.update_attributes review_params
      @review.dog.reviews.each do |review|
        rate += review.rate
      end
      rate_avg = rate / @review.dog.reviews.size
      rate_avg = (rate_avg*2).ceil.to_f / 2
      @review.dog.update_attributes rate: rate_avg
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
