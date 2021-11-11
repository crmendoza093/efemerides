module V1
  class EventsController < ApplicationController
    has_scope :by_effective_date, :matching_description
    before_action :event, only: %i[show update]

    def show
      render json: @event
    end

    def index
      render json: apply_scopes(Event).all
    end

    def create
      @event = Event.new(event_params)
      @event.save!
      render json: @event, status: :created
    end

    def update
      @event.update(event_params)
      @event.save!

      render json: @event
    end

    private

    def event
      @event ||= Event.find(params[:id])
    end

    def event_params
      params.permit(:description, :effective_date, :category_id, :image_url)
    end

    def unprocessable_entity
      render json: @event.errors, status: __method__
    end
  end
end
