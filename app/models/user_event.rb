class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event

  enum status: [:participation, :will_participate, :no_participate]
end
