class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.where('public = true').includes(:foods).includes(:user)
  end
end
