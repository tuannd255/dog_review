class UsersController < ApplicationController
  load_and_authorize_resource

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = "Successfully updated..."
    else
      flash[:danger] = "Not updated..."
    end
    redirect_to :back
  end
  private
  def user_params
    params.require(:user).permit :email, :name, :avatar
  end
end
