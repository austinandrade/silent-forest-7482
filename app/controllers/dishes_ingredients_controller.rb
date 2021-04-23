class DishesIngredientsController < ApplicationController
  def update
    dish = Dish.find(dishes_ingredients_params[:dish])
    ingredient = Ingredient.find(dishes_ingredients_params[:ingredient])
    DishesIngredient.where("dish_id = ?", dish.id).where("ingredient_id = ?", ingredient.id).destroy_all

    redirect_to "/ingredients/#{ingredient.id}"
  end

  private

  def dishes_ingredients_params
    params.permit(:id, :dish, :ingredient)
  end
end
