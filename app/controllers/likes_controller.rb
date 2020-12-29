class LikesController < ApplicationController


    def create 
        @food = Food.find(params[:id])
        @like = Like.find_or_create_by(favorites: @count, user_id: current_user.id, post_type: @food.class)
    end 

end
