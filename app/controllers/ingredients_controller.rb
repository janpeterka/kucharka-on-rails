# frozen_string_literal: true

class IngredientsController < ApplicationController
  load_and_authorize_resource
  # before_action :set_ingredient, only: %i[show edit update destroy]

  def index
    @ingredients = current_user.ingredients.includes(:category, :measurement).order(:name)

    if params[:query].present?
      query = "%#{params[:query].downcase}%"
      @ingredients = @ingredients.where('LOWER(ingredients.name) LIKE ? OR LOWER(ingredient_categories.name) LIKE ?',
                                        query, query).references(:category)
    end

    @pagy, @ingredients = pagy(@ingredients)
  end

  def show; end

  def new
    @ingredient = Ingredient.new
  end

  def edit; end

  def create
    @ingredient = current_user.ingredients.new(ingredient_params)

    if @ingredient.save
      redirect_to ingredient_url(@ingredient)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to ingredient_url(@ingredient), notice: 'surovina byla upravena'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @ingredient.destroy!

    redirect_to ingredients_url, notice: 'Ingredient was successfully destroyed.'
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :category_id, :measurement_id)
  end
end
