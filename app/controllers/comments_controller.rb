class CommentsController < ApplicationController
    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.create(comment_params)
        if @comment.valid? 
		    redirect_to @comment.recipe
	    else 
            flash[:errors] = @comment.errors.full_messages
            redirect_to comment_params["recipe_type"] == "Drink" ? Drink.find(comment_params["recipe_id"]) : Food.find(comment_params["recipe_id"])
	    end
    end

    def show
        @comment = Comment.find(params[:id])
    end

    def destroy 
        @comment = Comment.find(params[:id])
        if @comment.recipe_type == "Food"
            food = Food.find(@comment.recipe_id)
            @comment.destroy
            redirect_to food
        else
            drink = Drink.find(@comment.recipe_id)
            @comment.destroy
            redirect_to drink
        end
    end 

    private
    def comment_params
        params.require(:comment).permit(:content, :user_id, :recipe_id, :recipe_type)
    end
end
