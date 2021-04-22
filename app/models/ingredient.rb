class Ingredient < ApplicationRecord
  validates_presence_of :name, :calories

  has_many :dishes_ingredients
  has_many :dishes, through: :dishes_ingredients
  has_many :chefs, through: :dishes

  def distinct_chefs_alphabetized
    chefs.distinct.order(:name)
  end
end
