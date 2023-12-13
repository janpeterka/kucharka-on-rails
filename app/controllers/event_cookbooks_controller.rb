# frozen_string_literal: true

class EventCookbooksController < ApplicationController
  def show
    @event = Event.find(params[:event_id])
    @cookbook = EventCookbook.new(@event)

    respond_to do |format|
      format.html
      format.pdf do
        send_data @cookbook.pdf.render,
                  filename: "#{@event.name}_cookbook.pdf",
                  type: 'application/pdf',
                  disposition: 'inline'
      end
    end
  end
end
