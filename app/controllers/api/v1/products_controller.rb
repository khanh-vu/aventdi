module Api
  class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]

    # GET /products
    # GET /products.json
    def index
      if params[:product_category_id].present?
        @featured_products = ProductCategory.includes(:products).where(:id => params[:product_category_id], :products => {:is_featured => 1})
        @products = ProductCategory.includes(:products).where(:id => params[:product_category_id], :products => {:is_featured => 0})
      elsif
        @featured_products = Product.where(:is_featured => 1)
        @products = Product.where(:is_featured => 0)
      end
      # render json: @business_events, include: 'business_event_category, business_listing.name, business_addresses', fields: { event_activities: ['type'] }
      render json: {:featured => @featured_products, :products => @products}, status: 200
    end

    # GET /products/1
    # GET /products/1.json
    def show
      render json: @product, status: 200
    end

    # GET /products/new
    def new
      @product = Product.new
    end

    # GET /products/1/edit
    def edit
    end

    # POST /products
    # POST /products.json
    def create
      @product = Product.new(product_params)

      respond_to do |format|
        if @product.save
          format.html { redirect_to @product, notice: 'Product was successfully created.' }
          format.json { render :show, status: :created, location: @product }
        else
          format.html { render :new }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /products/1
    # PATCH/PUT /products/1.json
    def update
      respond_to do |format|
        if @product.update(product_params)
          format.html { redirect_to @product, notice: 'Product was successfully updated.' }
          format.json { render :show, status: :ok, location: @product }
        else
          format.html { render :edit }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /products/1
    # DELETE /products/1.json
    def destroy
      @product.destroy
      respond_to do |format|
        format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = Product.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def product_params
        params.fetch(:product, {})
      end
  end
end