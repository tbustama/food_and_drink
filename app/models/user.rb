class User < ApplicationRecord
    has_many :foods, dependent: :destroy
    has_many :drinks, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_secure_password
    validates_presence_of :name, :city, :username 
    validates_uniqueness_of :username
end
