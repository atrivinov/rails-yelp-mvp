class Review < ApplicationRecord
  validates :content, :rating, presence: true
  validates :rating, inclusion: { in: 0..5}, numericality: { only_integer: true } , message: "%{value} no es un valor valido, debe estar entre 1 y 5"
  belongs_to :restaurant
end
