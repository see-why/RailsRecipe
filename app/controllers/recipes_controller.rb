class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = current_user.recipes
  end

  def show
    @recipe = current_user.recipes.find(params[:id])
    @foods = current_user.foods
  end

  def new; end

  def create
    new_recipe = current_user.recipes.new(recipe_params)
    if new_recipe.save
      redirect_to recipe_path(new_recipe.id), notice: 'Success!'
    else
      render :new, alert: 'Error occured!'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      redirect_to recipes_path, notice: 'Successfully deleted!'
    else
      redirect_to recipes_path, alert: 'Error occured!'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :prep_time, :cook_time, :description, :public)
  end
end
