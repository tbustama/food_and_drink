class Drink < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :recipe
  has_many :likes, as: :post

  validates_presence_of :category, :name, :ingredients, :directions, :image_url

  def self.most_liked
    Drink.all.max_by{|drink| drink.likes.count}
  end

  def self.random
    Drink.all.sample 
  end

  def self.most_comments
    Drink.all.max_by{|drink| drink.comments}
  end

  def city
    self.user.city
  end

  def self.top_five_likes
    Drink.all.sort{|drink| drink.likes.count}.last(5).reverse
  end
  
end
