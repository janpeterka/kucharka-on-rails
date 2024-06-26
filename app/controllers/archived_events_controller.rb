# frozen_string_literal: true

class ArchivedEventsController < ApplicationController
  before_action :set_event, only: %i[create destroy]

  # POST /events
  def create
    @event.archive!
    flash[:notice] = "akce byla archivována"

    redirect_back_or_to @event
  end

  # DELETE /events/1
  def destroy
    @event.restore!
    flash[:notice] = "akce byla obnovena"

    redirect_back_or_to @event
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    if params[:id].present?
      @event = Event.find(params[:id])
    elsif params[:event_id].present?
      @event = Event.find(params[:event_id])
    end
  end
end
