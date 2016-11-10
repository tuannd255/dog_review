class Dog < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :category
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :weight, presence: true
  validates :height, presence: true
  validates :avg_life_expectancy, presence: true

  scope :search_dog, -> search_name {where "name LIKE :search_name",
    search_name: "%#{search_name}%"}
  scope :search_weight, ->search_name{where "weight = :search_name",
    search_name: "#{search_name}"}
  scope :search_height, ->search_name{where "height = :search_name",
    search_name: "#{search_name}"}

  class << self
    def search search_name, value
      if search_name == "name"
        search_dog value
      elsif search_name == "weight"
        search_weight value
      elsif search_name == "height"
        search_height value
      else
        all
      end
    end
  end
end
