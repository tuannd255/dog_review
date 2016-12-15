class Admin::ReviewsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def create
    if @review.save
      flash[:success] = "Successfully reviewed..."
    else
      flash[:danger] = "Not reviewed..."
    end
    redirect_to [:admin, @review.targetable]
  end

  def edit
    @targetable = @review.targetable
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
    redirect_to [:admin, @review.targetable]
  end

  def destroy
    targetable = @review.targetable
    if @review.destroy
      flash[:success] = "Successfully destroyed..."
    else
      flash[:danger] = "Not destroyed..."
    end
    redirect_to [:admin, targetable]
  end

  private
  def review_params
    params.require(:review).permit :content, :rate, :targetable_id, :user_id,
      :targetable_type
  end
end
