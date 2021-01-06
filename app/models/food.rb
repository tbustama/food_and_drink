class Food < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :recipe
  has_many :likes, as: :post

  validates_presence_of :category, :name, :ingredients, :directions, :image_url, :time 

  def self.most_liked
    Food.all.max_by{|food| food.likes.count}
  end

  def self.random
    Food.all.sample
  end

  def self.most_comments
    Food.all.max_by{|food| food.comments.count}
  end

  def self.longest_time
    Food.find_by(time: Food.maximum(:time))
  end

  def self.shortest_time
    Food.where("time < 31").limit(10)
  end

  def self.top_five_foods
    Food.all.sort{|food| food.likes.count}.last(5).reverse
  end

  def self.least_ingredients
    Food.all.min_by{|food| food.ingredients.split(",")}
  end

end
