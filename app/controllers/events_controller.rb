class EventsController < ApplicationController
  load_and_authorize_resource

  def index
    if params[:event_id] && @events.any?
      @event = Event.find_by id: params[:event_id]
      render "index.js.erb"
    else
      @event = @events.first
    end
  end

  def new
  end

  def create
    if @event.save
      flash[:success] = t "events.created"
      redirect_to events_path
    else
      flash[:danger] = t "events.not_created"
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update_attributes event_params
      flash[:success] = t "events.updated"
      redirect_to events_path
    else
      flash[:danger] = t "events.not_updated"
      render :edit
    end
  end

  def destroy
    if @event.destroy
      flash[:success] = t "events.deleted"
    else
      flash[:danger] = t "events.not_deleted"
    end
    redirect_to events_path
  end

  private
  def event_params
    params.require(:event).permit :name, :start_time, :location, :description,
      :user_id
  end
end
