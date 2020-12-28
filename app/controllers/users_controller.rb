class UsersController < ApplicationController

    def show 
        @user = User.find(params[:id])
    end 

    def new 
        @user = User.new 
    end 

    def create 
        @user = User.create(user_params)
        if @user.valid?
            redirect_to @user
        else 
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end 

    def edit 
        @user = User.find(params[:id]) 
    end 

    def update 
    end 

    def destroy 
    end 

    private 

    def user_params 
        params.require(:user).permit(:name, :city, :password, :username)
    end 

end
