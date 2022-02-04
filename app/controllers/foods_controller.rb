class FoodsController < ApplicationController
  def index
    @user = User.includes(:foods).find(current_user.id)
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
    if new_food.save
      redirect_to '/foods', notice: 'Success!'
    else
      render :new, alert: 'Error occured!'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    if @food.destroy
      redirect_to '/foods', notice: 'Successfully deleted!'
    else
      redirect_to '/foods', alert: 'Error occured!'
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
