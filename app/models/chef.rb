class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :dishes_ingredients, through: :dishes
  has_many :ingredients, through: :dishes_ingredients

  def most_popular_ingredients
    ingredients
    .select('ingredients.*, count(ingredients) as ingred_usage')
    .group('ingredients.id')
    .order(ingred_usage: :desc)
    .limit(3)
  end
end
