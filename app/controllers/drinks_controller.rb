class DrinksController < ApplicationController
    def new
        @drink = Drink.new
    end

    def update
        @drink= Drink.find(params[:id])
        @drink.update(drink_params)
	    if @drink.valid?
            redirect_to @drink
	    else
	    	flash[:errors] = @drink.errors.full_messages
	    	redirect_to edit_drink_path
	    end
    end

    def create
        @drink = Drink.create(drink_params)
        if @drink.valid? 
		    redirect_to @drink
	    else 
		    flash[:errors] = @drink.errors.full_messages
		    redirect_to new_drink_path
	    end
    end

    def edit
        @drink = Drink.find(params[:id])
    end

    def show
        @drink = Drink.find(params[:id])
        @comment = Comment.new
        @comments = Comment.all
    end
	
    def index
	    @drinks = Drink.all
    end

    def destroy 
	    @drink = Drink.find(params[:id])
	    @drink.destroy
	    redirect_to drinks_path
    end 

    private
    def drink_params
        params.require(:drink).permit(:name, :category, :ingredients, :directions, :image_url, :user_id)
    end
end
