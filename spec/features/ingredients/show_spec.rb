require 'rails_helper'

RSpec.describe 'ingredient show page' do
  before(:each) do
    @chef = Chef.create!(name: 'Gordon Ramsey')
    @chef_2 = Chef.create!(name: 'Chef 2')
    @chef_3 = Chef.create!(name: 'Chef 3')

    @ingredient = Ingredient.create!(name: 'Siracha', calories: 50)

    @dish_1 = @chef.dishes.create!(name: 'pasta', description: 'yummy pasta')
    @dish_2 = @chef.dishes.create!(name: 'chicken', description: 'great chicken')
    @dish_3 = @chef.dishes.create!(name: 'apples', description: 'crisp apples')
    @dish_4 = @chef.dishes.create!(name: 'candy', description: 'unhealthy')

    @dish_5 = @chef_2.dishes.create!(name: 'yummy', description: 'this is really great')
    @dish_6 = @chef_3.dishes.create!(name: 'tasty', description: 'wow its awesome')

    DishesIngredient.create!(dish: @dish_1, ingredient: @ingredient)
    DishesIngredient.create!(dish: @dish_2, ingredient: @ingredient)
    DishesIngredient.create!(dish: @dish_3, ingredient: @ingredient)
  end

  it 'displays ingredient attributes'  do
    visit "/ingredients/#{@ingredient.id}"

    expect(page).to have_content(@ingredient.name)
    expect(page).to have_content(@ingredient.calories)
  end

  it "displays names and descriptions of all dishes that include this ingredient" do
    visit "/ingredients/#{@ingredient.id}"

    expect(page).to have_content(@dish_1.name)
    expect(page).to have_content(@dish_1.description)

    expect(page).to have_content(@dish_2.name)
    expect(page).to have_content(@dish_2.description)

    expect(page).to have_content(@dish_3.name)
    expect(page).to have_content(@dish_3.description)

    expect(page).to_not have_content(@dish_4.name)
  end

  # it "displays unique associated chef names alphabetically ordered" do
  #   visit "/ingredients/#{@ingredient.id}"
  #
  #   expect(page).to have_content(@chef.name)
  #   expect(page).to have_content(@dish_1.description)
  #
  #   # Then I see the name of all chefs that use this ingredient in any of their dishes
  #   # And I see that the list of chefs is unique (contains no duplicate chefs)
  #   # And I see that the chefs are ordered alphabetically by name (A - Z)
  # end
end
