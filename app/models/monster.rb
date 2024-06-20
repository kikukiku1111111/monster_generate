class Monster < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :name, {presence: true}
  validates :attribution,{presence: true}
  validates :color,{presence: true}
  validates :animal,{presence: true}
end
