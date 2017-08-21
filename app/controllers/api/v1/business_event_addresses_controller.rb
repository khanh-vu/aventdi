module Api
  class BusinessEventAddressesController < ApplicationController
    before_action :set_business_event_address, only: [:show, :edit, :update, :destroy]

    # GET /event_address
    # GET /event_address.json
    def index
      if params[:business_event_category_id].present?
        @business_event_addresses = BusinessEventAddress.includes(:business_event).where(:business_events => {:business_event_category => params[:business_event_category_id]})
        render json: @business_event_addresses.to_json(only: [:id], include: {business_address: {only: [:id, :name, :address, :latitude, :longitude]}, business_event: {only:[:id, :name, :image], include: [:event_activities]}})
        return
      elsif
      @business_event_addresses = BusinessEvent.all
      end
      # render json: @business_events, include: 'business_event_category, business_listing.name, business_addresses', fields: { event_activities: ['type'] }
      render json: @business_event_addresses.to_json(include: [:business_event, :business_address]), status: 200
    end

    # GET /event_address/1
    # GET /event_address/1.json
    def show
      render json: @business_event_address.to_json(
          include: {
              business_event: {:methods => [:activity_types],
                  include: {event_activities: {except: []}}
              },
              business_address: {only: [:id, :name, :address, :latitude, :longitude]}
          }),
          status: 200
    end

    # GET /business_event_addresses/new
    def new
      @business_event_address = BusinessEventAddress.new
    end

    # GET /business_event_addresses/1/edit
    def edit
    end

    # POST /business_event_addresses
    # POST /business_event_addresses.json
    def create
      @business_event_address = BusinessEventAddress.new(business_event_address_params)

      respond_to do |format|
        if @business_event_address.save
          format.html { redirect_to @business_event_address, notice: 'Business event address was successfully created.' }
          format.json { render :show, status: :created, location: @business_event_address }
        else
          format.html { render :new }
          format.json { render json: @business_event_address.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /business_event_addresses/1
    # PATCH/PUT /business_event_addresses/1.json
    def update
      respond_to do |format|
        if @business_event_address.update(business_event_address_params)
          format.html { redirect_to @business_event_address, notice: 'Business event address was successfully updated.' }
          format.json { render :show, status: :ok, location: @business_event_address }
        else
          format.html { render :edit }
          format.json { render json: @business_event_address.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /business_event_addresses/1
    # DELETE /business_event_addresses/1.json
    def destroy
      @business_event_address.destroy
      respond_to do |format|
        format.html { redirect_to business_event_addresses_url, notice: 'Business event address was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_business_event_address
        @business_event_address = BusinessEventAddress.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def business_event_address_params
        params.fetch(:business_event_address, {})
      end
  end
end

