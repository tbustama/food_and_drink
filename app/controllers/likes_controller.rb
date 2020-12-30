class LikesController < ApplicationController

    def create_food_like 
        if already_liked_food?
            flash[:notice] = "You can't like more than once"
            redirect_to food_path
          else
            @food = Food.find(params[:id])
            @food.likes.create(user_id: current_user.id, post_type: @food.class)
            redirect_to @food
        end
    end 

    def create_drink_like 
        if already_liked_drink?
            flash[:notice] = "You can't like more than once"
            redirect_to drink_path
        else 
            @drink = Drink.find(params[:id])
            @drink.likes.create(user_id: current_user.id, post_type: @drink.class)
            redirect_to @drink
        end 
    end 

    private 

    def already_liked_food?
        food = Food.find(params[:id])
        Like.where(user_id: current_user.id, post_id: food.id).exists?
    end

    def already_liked_drink?
        drink = Drink.find(params[:id])
        Like.where(user_id: current_user.id, post_id: drink.id).exists?
    end

end
