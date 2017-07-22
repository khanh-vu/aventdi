class BusinessEventsController < ApplicationController
  before_action :set_business_event, only: [:show, :edit, :update, :destroy]

  # GET /business_events
  # GET /business_events.json
  def index
    @business_events = BusinessEvent.all
  end

  # GET /business_events/1
  # GET /business_events/1.json
  def show
  end

  # GET /business_events/new
  def new
    @business_event = BusinessEvent.new
  end

  # GET /business_events/1/edit
  def edit
  end

  # POST /business_events
  # POST /business_events.json
  def create
    @business_event = BusinessEvent.new(business_event_params)

    respond_to do |format|
      if @business_event.save
        format.html { redirect_to @business_event, notice: 'Business event was successfully created.' }
        format.json { render :show, status: :created, location: @business_event }
      else
        format.html { render :new }
        format.json { render json: @business_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /business_events/1
  # PATCH/PUT /business_events/1.json
  def update
    respond_to do |format|
      if @business_event.update(business_event_params)
        format.html { redirect_to @business_event, notice: 'Business event was successfully updated.' }
        format.json { render :show, status: :ok, location: @business_event }
      else
        format.html { render :edit }
        format.json { render json: @business_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_events/1
  # DELETE /business_events/1.json
  def destroy
    @business_event.destroy
    respond_to do |format|
      format.html { redirect_to business_events_url, notice: 'Business event was successfully destroyed.' }
      format.json { head :no_content }
    end
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
