class UserEventsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def create
    UserEvent.create user: current_user, event_id: params[:event_id],
      status: params[:status]
    redirect_to events_path
  end

  def update
    @user_event = UserEvent.find_by id: params[:id]
    if @user_event.update_attributes status: params[:status]
      flash[:success] = "Successfully updated..."
    else
      flash[:danger] = "Not updated..."
    end
    redirect_to events_path
  end
end
