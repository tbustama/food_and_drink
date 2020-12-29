class LikesController < ApplicationController

    before_action :find_food
    before_action :find_drink

    def create 
        
    end 

    private 

    def find_food 
        @food = Food.find(params[:food_id])
    end 

    def find_drink
    end 


end
