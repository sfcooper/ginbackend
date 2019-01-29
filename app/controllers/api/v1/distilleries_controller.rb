class Api::V1::DistilleriesController < ApplicationController
    before_action :set_distillery, only: [:show, :update, :destroy]
  
    # GET /distilleries
    def index
      @distilleries = Distillery.order(distillery_name: 'ASC')
  
      render json: @distilleries
    end
  
    # GET /distilleries/1
    def show
      render json: @distillery
    end
  
    # POST /distilleries
    def create
      @distillery = Distillery.new(distillery_params)
  
      if @distillery.save
        render json: @distillery, status: :created, location: @distillery
      else
        render json: @distillery.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /distilleries/1
    def update
      if @distillery.update(distillery_params)
        render json: @distillery
      else
        render json: @distillery.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /distilleries/1
    def destroy
      @distillery.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_distillery
        @distillery = Distillery.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def distillery_params
        params.require(:distillery).permit(:distillery_name, :snippet, :description, :abv)
      end
  end
  
