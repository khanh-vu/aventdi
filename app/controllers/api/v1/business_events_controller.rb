module Api
  class BusinessEventsController < ApplicationController
    before_action :set_business_event, only: [:show, :edit, :update, :destroy]

    # GET /api/v1/event
    # GET /api/v1/event.json
    def index
      if params[:business_event_category_id].present?
        @business_events = BusinessEventCategory.find(params[:business_event_category_id]).business_events
        render json: @business_events.collect{|event|event.business_addresses}.first.to_json(include: {business_events: {only:[:name, :image], include: [:event_activities]}})
        return
      elsif
      @business_events = BusinessEvent.all
      end
      # render json: @business_events, include: 'business_event_category, business_listing.name, business_addresses', fields: { event_activities: ['type'] }
      render json: @business_events.to_json(include: [:business_listing, :business_event_category, :business_addresses]), status: 200
    end

    # GET /api/v1/event/1
    # GET /api/v1/event/1.json
    def show
      render json: @business_event.to_json(
          :methods => [:activity_types],
          include: {
              business_addresses: {only: [:id, :name, :address, :latitude, :longitude]},
              event_activities: {except: []}
          }),
             status: 200
    end

    # GET /api/v1/event/locations
    # GET /api/v1/event/locations.json
    def location_list
      @business_events = BusinessEvent.select(:id, :name, :image, :business_event_category_id)
      render json: @business_events.to_json(
          :methods => [:activity_types, :marker],
          include: {
              business_addresses: {only: [:id, :name, :address, :latitude, :longitude]},
              event_activities: {except: []}
          }),
          status: 200
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_event
      @business_event = BusinessEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_event_params
      params.require(:business_event).permit(:name, :description, :business_listing_id, :category_code, :activity_types)
    end
  end
end