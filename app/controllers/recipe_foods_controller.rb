class RecipeFoodsController < ApplicationController
  def create
    @recipe = current_user.recipes.find(params[:recipe_id])
    @recipe_foods = @recipe.recipe_foods.new(recipe_foods_params)
    respond_to do |format|
      format.html do
        if @recipe_foods.save
          redirect_to recipe_path(@recipe.id), notice: 'Ingredient saved successfully'
        else
          redirect_to recipe_path(@recipe.id), alert: 'Error, Recipe not created!'
        end
      end
    end
  end

  def destroy
    @r_food = RecipeFood.find(params[:id])
    if @r_food.destroy
      redirect_to recipe_path(params[:recipe_id]), notice: 'Successfully deleted!'
    else
      redirect_to recipe_path(params[:recipe_id]), alert: 'Error occured!'
    end
  end

  private

  def recipe_foods_params
    params.require(:recipe_foods).permit(:quantity, :food_id)
  end
end
