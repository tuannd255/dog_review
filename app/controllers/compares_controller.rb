class ComparesController < ApplicationController

  def index
    ids = []
    1000.times do |n|
      if params["dog_#{n}".to_sym]
        ids << params["dog_#{n}".to_sym]
      else
        break
      end
    end
    @dogs = ids.map do |id|
      Dog.find_or_initialize_by id: id
    end
    @col = 12/@dogs.size
  end

  def new
    @dog = Dog.find_by id: params[:dog_id]
    respond_to do |format|
      format.html
      format.js
    end
  end
end
