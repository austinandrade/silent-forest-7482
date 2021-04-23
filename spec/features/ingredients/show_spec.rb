require 'rails_helper'

RSpec.describe 'ingredient show page' do
  before(:each) do
    @chef = Chef.create!(name: 'Gordon Ramsey')
    @chef_2 = Chef.create!(name: 'Alan Watts')
    @chef_3 = Chef.create!(name: 'Zelda')

    @ingredient = Ingredient.create!(name: 'Siracha', calories: 50)
    @ingredient_2 = Ingredient.create!(name: 'Beans', calories: 100)

    @dish_1 = @chef.dishes.create!(name: 'pasta', description: 'yummy pasta')
    @dish_2 = @chef.dishes.create!(name: 'chicken', description: 'great chicken')
    @dish_3 = @chef.dishes.create!(name: 'apples', description: 'crisp apples')
    @dish_4 = @chef.dishes.create!(name: 'candy', description: 'unhealthy')

    @dish_5 = @chef_2.dishes.create!(name: 'yummy', description: 'this is really great')
    @dish_6 = @chef_3.dishes.create!(name: 'tasty', description: 'wow its awesome')

    DishesIngredient.create!(dish: @dish_1, ingredient: @ingredient)
    DishesIngredient.create!(dish: @dish_2, ingredient: @ingredient)
    DishesIngredient.create!(dish: @dish_3, ingredient: @ingredient)
    DishesIngredient.create!(dish: @dish_5, ingredient: @ingredient)
    DishesIngredient.create!(dish: @dish_6, ingredient: @ingredient_2)
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

  it "displays unique associated chef names alphabetically ordered" do
    visit "/ingredients/#{@ingredient.id}"

    expect(page).to have_content(@chef.name, count: 1)
    expect(page).to have_content(@chef_2.name, count: 1)
    expect(page).to_not have_content(@chef_3.name)

    expect(@chef_2.name).to appear_before(@chef.name)
  end

  it "displays delete buttons next to each dish" do
    visit "/ingredients/#{@ingredient.id}"

    within "#dish-#{@dish_1.id}" do
      expect(page).to have_button("remove")
    end

    within "#dish-#{@dish_2.id}" do
      expect(page).to have_button("remove")
    end

    within "#dish-#{@dish_3.id}" do
      expect(page).to have_button("remove")
    end

    within "#dish-#{@dish_5.id}" do
      expect(page).to have_button("remove")
    end


    # When I click one of these buttons
    # Then the ingredient is no longer associated with the dish
    # And I am returned to the ingredient's show page
    # And I no longer see the dish listed
    # (Note: You should not destroy the dish record entirely)
  end

  it "displays delete buttons next to each dish" do
    visit "/ingredients/#{@ingredient.id}"

    within "#dish-#{@dish_1.id}" do
      click_button "remove"
    end

    expect(page).to_not have_content(@dish_1.name)
    expect(page).to have_current_path("/ingredients/#{@ingredient.id}")
  end
end
