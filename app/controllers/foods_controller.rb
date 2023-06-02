class FoodsController < ApplicationController
 
    def index
        @foods = current_user.foods
    end
    def new
        @first_user = current_user
        @food = Food.new
    end
    
      def create
        # new object from params
        @food = Food.new(food_params.merge(:user_id => current_user.id))
        if @food.save
          redirect_to foods_path
        else
            flash.now[:error] = 'There was an error with your input. Please check your data and try again.'
            render 'new'
        end
      end

      def destroy
        @food = current_user.foods.find(params[:id]) 
    
        @food.destroy
        redirect_to foods_path
      end

     

      private 

      def food_params
        params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
      end

end
