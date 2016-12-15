class ReviewsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def create
    rate = 0
    if @review.save
      if @review.targetable_type == Dog.name
        @review.targetable.reviews.each do |review|
          rate += review.rate
        end
        rate_avg = rate / @review.targetable.reviews.size
        rate_avg = (rate_avg*2).ceil.to_f / 2
        @review.targetable.update_attributes rate: rate_avg
      end
      flash.now[:success] = "Successfully reviewed..."
    else
      flash.now[:danger] = "Not reviewed..."
    end
    if @review.targetable_type == Dog.name
      redirect_to @review.targetable
    else
      @events = Event.all
      @event = @review.targetable
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def edit
    if @review.targetable_type == Dog.name
      @dog = @review.targetable
    else
      @event = @review.targetable
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    rate = 0
    if @review.update_attributes review_params
      if @review.targetable_type == Dog.name
        @review.targetable.reviews.each do |review|
          rate += review.rate
        end
        rate_avg = rate / @review.targetable.reviews.size
        rate_avg = (rate_avg*2).ceil.to_f / 2
        @review.targetable.update_attributes rate: rate_avg
      end
      flash.now[:success] = "Successfully reviewed..."
    else
      flash.now[:danger] = "Not reviewed..."
    end
    if @review.targetable_type == Dog.name
      redirect_to @review.targetable
    else
      @events = Event.all
      @event = @review.targetable
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def destroy
    targetable = @review.targetable
    if @review.destroy
      flash.now[:danger] = "Successfully destroyed..."
    else
      flash.now[:danger] = "Not destroyed..."
    end
    if targetable.class.name == Dog.name
      @dog = targetable
      rate = 0
      targetable.reviews.each do |review|
        rate += review.rate
      end
      rate_avg = rate / targetable.reviews.size
      rate_avg = (rate_avg*2).ceil.to_f / 2
      targetable.update_attributes rate: rate_avg
    else
      @events = Event.all
      @event = targetable
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def review_params
    params.require(:review).permit :content, :rate, :targetable_id, :user_id,
      :targetable_type
  end
end
