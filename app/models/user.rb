class User < ApplicationRecord
    has_many :foods
    has_many :drinks
    has_many :likes
    has_many :comments
end
