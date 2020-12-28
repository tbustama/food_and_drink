class CommentsController < ApplicationController
    def new
        @comment = Comment.new
    end

    def update
        @comment= Comment.find(params[:id])
        @comment.update(comment_params)
	    if @comment.valid?
        	redirect_to @comment
	    else
		    flash[:errors] = @comment.errors.full_messages
		    redirect_to edit_comment_path
	    end
    end

    def create
        byebug
        @comment = Comment.create(comment_params)
        if @comment.valid? 
		    redirect_to @comment.recipe
	    else 
            flash[:errors] = @comment.errors.full_messages
            redirect_to comment_params["recipe_type"] == "Drink" ? Drink.find(comment_params["recipe_id"]) : Food.find(comment_params["recipe_id"])
	    end
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def show
        @comment = Comment.find(params[:id])
    end
	
    def index
	    @comments = Comment.all
    end

    def destroy 
	    @comment = Comment.find(params[:id])
	    @comment.destroy
	    redirect_to comments_path
    end 

    private
    def comment_params
        params.require(:comment).permit(:content, :user_id, :recipe_id, :recipe_type)
    end
end
