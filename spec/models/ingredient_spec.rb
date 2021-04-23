require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :calories}
  end
  describe "relationships" do
    it {should have_many :dishes_ingredients}
    it {should have_many(:dishes).through(:dishes_ingredients)}
    it {should have_many(:chefs).through(:dishes)}
  end

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

  describe "instance methods" do
    describe "#distinct_chefs_alphabetized" do
      it "lists all distinct chefs associated with an ingredient in alphabetical order" do
        expect(@ingredient.distinct_chefs_alphabetized).to eq([@chef_2, @chef])
        expect(@ingredient.distinct_chefs_alphabetized).to_not include(@chef_3)
      end
    end
  end
end
