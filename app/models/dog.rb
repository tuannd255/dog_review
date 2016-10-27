class Dog < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :category
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :weight, presence: true
  validates :height, presence: true
  validates :avg_life_expectancy, presence: true
end
