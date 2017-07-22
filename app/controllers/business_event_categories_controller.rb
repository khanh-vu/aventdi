class BusinessEventCategoriesController < ApplicationController
  before_action :set_business_event_category, only: [:show, :edit, :update, :destroy]

  # GET /business_event_categories
  # GET /business_event_categories.json
  def index
    @business_event_categories = BusinessEventCategory.all
  end

  # GET /business_event_categories/1
  # GET /business_event_categories/1.json
  def show
  end

  # GET /business_event_categories/new
  def new
    @business_event_category = BusinessEventCategory.new
  end

  # GET /business_event_categories/1/edit
  def edit
  end

  # POST /business_event_categories
  # POST /business_event_categories.json
  def create
    @business_event_category = BusinessEventCategory.new(business_event_category_params)

    respond_to do |format|
      if @business_event_category.save
        format.html { redirect_to @business_event_category, notice: 'Business event category was successfully created.' }
        format.json { render :show, status: :created, location: @business_event_category }
      else
        format.html { render :new }
        format.json { render json: @business_event_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /business_event_categories/1
  # PATCH/PUT /business_event_categories/1.json
  def update
    respond_to do |format|
      if @business_event_category.update(business_event_category_params)
        format.html { redirect_to @business_event_category, notice: 'Business event category was successfully updated.' }
        format.json { render :show, status: :ok, location: @business_event_category }
      else
        format.html { render :edit }
        format.json { render json: @business_event_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_event_categories/1
  # DELETE /business_event_categories/1.json
  def destroy
    @business_event_category.destroy
    respond_to do |format|
      format.html { redirect_to business_event_categories_url, notice: 'Business event category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_event_category
      @business_event_category = BusinessEventCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_event_category_params
      params.require(:business_event_category).permit(:code, :business_event_id, :name, :parent_id, :level, :icon, :background)
    end
end
