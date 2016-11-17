class FavoritesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @favorites = current_user.favorites.includes :dog
  end

  def create
    @dog = Dog.find_by id: params[:dog_id]
    @favorite = current_user.favorites.build dog_id: params[:dog_id]
    if @favorite.save
      flash.now[:success] = "You liked"
    else
      flash.now[:danger] = "Not liked"
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @dog = @favorite.dog
    if @favorite.destroy
      flash.now[:danger] = "You unliked"
    else
      flash.now[:danger] = "Not unliked"
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
end
