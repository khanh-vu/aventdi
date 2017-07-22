module Api
  class BusinessEventsController < ApplicationController
    before_action :set_business_event, only: [:show, :edit, :update, :destroy]

    # GET /api/v1/business_events
    # GET /api/v1/business_events.json
    def index
      if params[:business_event_category_id].present?
        @business_events = BusinessEventCategory.find(params[:business_event_category_id]).business_events
      elsif
        @business_events = BusinessEvent.all
      end
      render json: @business_events, status: 200
    end

    # GET /api/v1/business_events/1
    # GET /api/v1/business_events/1.json
    def show
      @business_event
      render json: @business_event, status: 200
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

