# frozen_string_literal: true

class DailyPlanTasksController < ApplicationController
  before_action :set_daily_plan_task, only: %i[show edit update destroy]

  def index
    @daily_plan_tasks = DailyPlanTask.all
  end

  def show; end

  def new
    @daily_plan_task = DailyPlanTask.new
  end

  def edit; end

  # POST /daily_plan_tasks
  def create
    @daily_plan_task = DailyPlanTask.new(daily_plan_task_params)

    flash[:error] = @daily_plan_task.errors.full_messages.to_sentence unless @daily_plan_task.save

    redirect_to @daily_plan_task.daily_plan
  end

  def update
    if @daily_plan_task.update(daily_plan_task_params)
      flash[:notice] = "Daily plan task was successfully updated."
    else
      flash[:error] = @daily_plan_task.errors.full_messages.to_sentence
    end

    redirect_to @daily_plan_task.daily_plan
  end

  def destroy
    @daily_plan_task.destroy!

    redirect_to @daily_plan_task.daily_plan, status: :see_other
  end

  private

  def set_daily_plan_task
    @daily_plan_task = DailyPlanTask.find(params[:id])
  end

  def daily_plan_task_params
    params.fetch(:daily_plan_task, params).permit(:daily_plan_id, :name, :description, :status)
  end
end
