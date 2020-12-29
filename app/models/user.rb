class User < ApplicationRecord
    has_many :foods
    has_many :drinks
    has_many :likes
    has_many :comments
    has_secure_password
    validates_presence_of :name, :city, :username 
    validates_uniqueness_of :username
end
