class DailyPlanRecipesController < ApplicationController
  before_action :set_daily_plan_recipe, only: %i[show edit update destroy]

  # GET /daily_plan_recipes
  def index
    @daily_plan_recipes = DailyPlanRecipe.all
  end

  # GET /daily_plan_recipes/1
  def show; end

  # GET /daily_plan_recipes/new
  def new
    @daily_plan_recipe = DailyPlanRecipe.new
  end

  # GET /daily_plan_recipes/1/edit
  def edit; end

  # POST /daily_plan_recipes
  def create
    @daily_plan_recipe = DailyPlanRecipe.new(daily_plan_recipe_params)

    unless @daily_plan_recipe.save
      flash[:error] = "recept nebyl přidán: #{@daily_plan_recipe.errors.full_messages.join(', ')}"
    end

    redirect_to request.referrer
  end

  def update
    if @daily_plan_recipe.update(daily_plan_recipe_params)
      redirect_to request.referrer, notice: 'Daily plan recipe was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /daily_plan_recipes/1
  def destroy
    @daily_plan_recipe.destroy!

    redirect_to request.referrer, notice: 'recept byl odebrán'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_daily_plan_recipe
    @daily_plan_recipe = DailyPlanRecipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def daily_plan_recipe_params
    params.fetch(:daily_plan_recipe, params)
          .permit(:daily_plan_id, :recipe_id, :meal_type, :portion_count)
          .transform_values(&:presence).transform_values { _1&.strip }
  end
end