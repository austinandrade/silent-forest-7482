require 'rails_helper'

RSpec.describe 'ingredient show page' do
  before(:each) do
    @chef = Chef.create!(name: 'Gordon Ramsey')

    @ingredient = Ingredient.create!(name: 'Siracha', calories: 50)
    @ingredient_2 = Ingredient.create!(name: 'Beans', calories: 100)
    @ingredient_3 = Ingredient.create!(name: 'Rice', calories: 25)
    @ingredient_4 = Ingredient.create!(name: 'Corn', calories: 10)

    @dish_1 = @chef.dishes.create!(name: 'pasta', description: 'yummy pasta')
    @dish_2 = @chef.dishes.create!(name: 'chicken', description: 'great chicken')
    @dish_3 = @chef.dishes.create!(name: 'apples', description: 'crisp apples')
    @dish_4 = @chef.dishes.create!(name: 'candy', description: 'unhealthy')
    @dish_5 = @chef.dishes.create!(name: 'yummy', description: 'this is really great')
    @dish_6 = @chef.dishes.create!(name: 'tasty', description: 'wow its awesome')

    DishesIngredient.create!(dish: @dish_1, ingredient: @ingredient)
    DishesIngredient.create!(dish: @dish_2, ingredient: @ingredient)
    DishesIngredient.create!(dish: @dish_3, ingredient: @ingredient_2)
    DishesIngredient.create!(dish: @dish_5, ingredient: @ingredient_2)
    DishesIngredient.create!(dish: @dish_6, ingredient: @ingredient_2)
    DishesIngredient.create!(dish: @dish_1, ingredient: @ingredient_3)
    DishesIngredient.create!(dish: @dish_2, ingredient: @ingredient_3)
    DishesIngredient.create!(dish: @dish_3, ingredient: @ingredient_3)
    DishesIngredient.create!(dish: @dish_4, ingredient: @ingredient_3)
  end

  it 'displays ingredient attributes'  do
    visit "/chefs/#{@chef.id}"

    within "#most_popular_dishes" do

      expect(page).to have_content(@ingredient.name)
      expect(page).to have_content(@ingredient_2.name)
      expect(page).to have_content(@ingredient_3.name)
      expect(page).to_not have_content(@ingredient_4.name)
    end
  end
end
