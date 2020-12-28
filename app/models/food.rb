class Food < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :recipe
  has_many :likes, as: :post

  validates_presence_of :category, :name, :ingredients, :directions, :image_url, :time 
end
