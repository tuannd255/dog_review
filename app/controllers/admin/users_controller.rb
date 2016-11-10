class Admin::UsersController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def destroy
    if @user.destroy
      flash[:success] = t "users.deleted"
    else
      flash[:danger] = t "users.delete_fail"
    end
    redirect_to admin_users_path
  end

  private
  def user_params
    params.require(:user).permit :email, :name, :avatar
  end
end
