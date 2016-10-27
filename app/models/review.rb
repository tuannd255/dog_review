class Review < ApplicationRecord
  belongs_to :dog
  belongs_to :user

  delegate :name, to: :user, prefix: true, allow_nil: true

  validates :content, presence: true
end
