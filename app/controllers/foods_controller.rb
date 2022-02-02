class FoodsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @foods = @user.foods
  end

  def new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    new_food = current_user.foods.new(food_params)
    new_food.user_id = current_user.id
    binding.pry
    if new_food.save
      redirect_to '/foods', notice: 'Success!'
    else
      render :new, alert: 'Error occured!'
    end
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
