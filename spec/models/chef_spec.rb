require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

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

  describe 'instance methods' do
    describe '#most_popular_ingredients' do
      it "displays the chef's three ingredients in descending order" do
        expect(@chef.most_popular_ingredients).to eq([@ingredient_3, @ingredient_2, @ingredient])
      end
    end
  end
end
