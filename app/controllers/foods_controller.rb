class FoodsController < ApplicationController
    
    def index 
        @foods = Food.all 
    end 

    def show 
        @food = Food.find(params[:id])
        @comment = Comment.new 
        @comments = Comment.where(recipe_id: @food.id, recipe_type: @food.class.to_s)
    end 

    def new 
        @food = Food.new 
    end 

    def create 
        
        @food = Food.create(food_params)

        #@food.user_id = session[:user_id]
        if @food.valid?
            redirect_to @food 
        else 
            flash[:errors] = @food.errors.full_messages
            redirect_to new_food_path
        end

    end 

    def edit 
        @food = Food.find(params[:id])
    end 

    def update 
        @food = Food.find(params[:id])
        @food.update(food_params)
        if @food.valid?
            redirect_to @food 
        else 
            flash[:errors] = @food.errors.full_messages
            redirect_to edit_food_path
        end 
    end 

    def destroy 
        @food = Food.find(params[:id])
        @food.destroy
        redirect_to foods_path
    end 

    private 

    def food_params 
        params.require(:food).permit(:category, :name, :ingredients, :directions, :image_url, :time, :user_id)
    end 

end 
