module Api
  class BusinessEventCategoriesController < ApiController
    # before_action :authenticate_user!
    before_action :set_business_event_category, only: [:show, :edit, :update, :destroy]

    # GET api/v1/business_event_categories
    # GET api/v1/business_event_categories.json
    def index
      @business_event_categories = BusinessEventCategory.all
      render json: @business_event_categories, status: 200
    end

    # GET api/v1/business_event_categories/1
    # GET api/v1/business_event_categories/1.json
    api :GET, 'api/v1/business_event_categories/:id'
    param :id, :number
    def show
      @business_event_category
      render json: @business_event_category, status: 200
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
end

