class Review < ApplicationRecord
  belongs_to :targetable, polymorphic: true
  belongs_to :user

  delegate :name, to: :user, prefix: true, allow_nil: true

  validates :content, presence: true
  validates :rate, presence: true
end
