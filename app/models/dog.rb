class Dog < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :category
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, presence: true
  validates :weight, presence: true
  validates :height, presence: true
  validates :avg_life_expectancy, presence: true

  scope :search_dog, -> search_name {where "name ILIKE :search_name",
    search_name: "%#{search_name}%"}
  scope :search_weight, ->value, value_2{where "weight >= ? and weight <= ?",
    value, value_2}
  scope :search_height, ->value, value_2{where "height >= ? and height <= ?",
    value, value_2}

  class << self
    def search search_name, value, value_2
      if search_name == "name"
        search_dog value
      elsif search_name == "weight"
        search_weight value, value_2
      elsif search_name == "height"
        search_height value, value_2
      else
        all
      end
    end
  end
end
