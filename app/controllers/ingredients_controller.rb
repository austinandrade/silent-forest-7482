class IngredientsController < ApplicationController
  def show
    @ingredient = Ingredient.find(ingredient_params[:id])
  end

  private

  def ingredient_params
    params.permit(:id, :name, :calories)
  end
end
