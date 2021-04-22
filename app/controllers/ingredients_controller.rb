class IngredientsController < ApplicationController
  def show
    @ingredient = Ingredient.find(ingredient_params[:id])
  end
  #
  # def new
  #   @shelter = Shelter.find(params[:shelter_id])
  # end
  #
  # def create
  #   pet = Pet.new(pet_params)
  #
  #   if pet.save
  #     #string interpolate here; can't because of snippet
  #     redirect_to "/shelters/pet_params[:shelter_id]/pets"
  #   else
  #     #string interpolate here; can't because of snippet
  #     redirect_to "/shelters/pet_params[:shelter_id]/pets/new",
	# 		#if using flashes incorporate the following code into application_controller:
	# 		# private
  #
	# 		# def error_message(errors)
	# 		  # errors.full_messages.join(', ')
	# 		# end
  #
	#     #alert: "Error: string interpolate; hashtag error_message(merchant.errors)"
  #   end
  # end

  # def edit
  #   @pet = Pet.find(params[:id])
  # end

  # def update
  #   pet = Pet.find(params[:id])
  #   if pet.update(pet_params)
  #     redirect_to show page route
  #   else
  #     #string interpolate here; can't because of snippet
  #     redirect_to "/pets/pet.id/edit",
  #     #alert: "Error: string interpolate hashtag error_message(merchant.errors)
  #   end
  # end

  # def destroy
  #   Pet.find(params[:id]).destroy
  #   redirect_to '/pets'
  # end

  private

  def ingredient_params
    params.permit(:id, :name, :calories)
  end
end
