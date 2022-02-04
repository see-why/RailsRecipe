class GeneralShoppingListController < ApplicationController
  def index
    @shopping = current_user.recipes.includes(:recipe_foods)
    @food_items = 0
    @prices = 0
  end
end
