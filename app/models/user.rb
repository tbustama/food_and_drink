class User < ApplicationRecord
    has_many :foods, dependent: :destroy
    has_many :drinks, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_secure_password
    validates_presence_of :name, :city, :username 
    validates_uniqueness_of :username


    def self.most_pop_city
        User.all.max_by{|user| user.city}
    end 

    def self.most_food_posts
        User.all.max_by{|user| user.foods.count} 
    end 

    def self.most_drink_posts
        User.all.max_by{|user| user.drinks.count}
    end 

    def featured_food 
        self.foods.max_by{|user| user.likes.count}
    end 
    
    def featured_drink 
        self.drinks.max_by{|user| user.likes.count}
    end 

    def all_likes 
        food_likes = self.foods.sum{|user| user.likes.count}
        drink_likes = self.drinks.sum{|user| user.likes.count}
        total = food_likes + drink_likes
    end 

    def self.like_sort 
        User.all.sort_by{|user| user.all_likes}.reverse
    end 

end
