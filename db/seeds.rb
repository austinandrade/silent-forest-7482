# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@chef = Chef.create!(name: 'Gordon Ramsey')
@chef_2 = Chef.create!(name: 'Cheffy 2')

@ingredient = Ingredient.create!(name: 'Siracha', calories: 50)
@ingredient_2 = Ingredient.create!(name: 'Beans', calories: 100)
@ingredient_3 = Ingredient.create!(name: 'Rice', calories: 25)
@ingredient_4 = Ingredient.create!(name: 'Corn', calories: 10)
@ingredient_5 = Ingredient.create!(name: 'weat', calories: 40)

@dish_1 = @chef.dishes.create!(name: 'pasta', description: 'yummy pasta')
@dish_2 = @chef.dishes.create!(name: 'chicken', description: 'great chicken')
@dish_3 = @chef.dishes.create!(name: 'apples', description: 'crisp apples')
@dish_4 = @chef.dishes.create!(name: 'candy', description: 'unhealthy')
@dish_5 = @chef_2.dishes.create!(name: 'yummy', description: 'this is really great')
@dish_6 = @chef_2.dishes.create!(name: 'tasty', description: 'wow its awesome')

DishesIngredient.create!(dish: @dish_1, ingredient: @ingredient)
DishesIngredient.create!(dish: @dish_2, ingredient: @ingredient)
DishesIngredient.create!(dish: @dish_3, ingredient: @ingredient_2)
DishesIngredient.create!(dish: @dish_5, ingredient: @ingredient_2)
DishesIngredient.create!(dish: @dish_6, ingredient: @ingredient_2)
DishesIngredient.create!(dish: @dish_1, ingredient: @ingredient_3)
DishesIngredient.create!(dish: @dish_2, ingredient: @ingredient_3)
DishesIngredient.create!(dish: @dish_3, ingredient: @ingredient_3)
DishesIngredient.create!(dish: @dish_4, ingredient: @ingredient_3)
DishesIngredient.create!(dish: @dish_4, ingredient: @ingredient_5)
