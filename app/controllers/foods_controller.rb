class FoodsController < ApplicationController

    # <%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %> caused a webpacker error when left in on line 10 within /views.application.html.erb 
    # Took it out to not have issues, but may need it later on.
    def index 
        @foods = Food.all 
    end 

    def show 
        @food = Food.find(params[:id])
    end 

    def new 
        @food = Food.new 
    end 

    def create 

        # don't know how to implement the user_id collection select or even if it's need yet
        #  <%= f.collection_select :user_id, @user, :id, :name %>
        
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
