class Drink < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :recipe
  has_many :likes, as: :post

  validates_presence_of :category, :name, :ingredients, :directions, :image_url

  def self.most_liked
    Drink.all.max_by{|drink| drink.likes}
  end

  def self.random
    Drink.all.sample 
  end

  def self.most_comments
    Drink.all.max_by{|drink| drink.comments}
  end

  def self.most_ingredients
    Drink.all.max_by{|drink| drink.ingredients.split(",")}
  end

  def city
    self.user.city
  end
  
end
