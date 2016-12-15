class Event < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :user_events, dependent: :destroy
  has_many :users, through: :user_events
  has_many :reviews, dependent: :destroy, as: :targetable

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :name, presence: true
  validate :check_time

  scope :event_of_user, ->user_id{joins(:user_events)
    .where("(user_events.user_id = ? AND user_events.status =
    #{UserEvent.statuses[:participation]}) OR events.user_id = ?", user_id, user_id).distinct}

  private
  def check_time
    if start_time && end_time && start_time > end_time
      errors.add :end_time, "cannot left than start time"
    elsif start_time && start_time < Time.zone.now
      errors.add :start_time, "cannot left than time now"
    end
  end
end
