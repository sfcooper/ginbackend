class Api::V1::GinsController < ApplicationController
  before_action :set_gin, only: [:show, :update, :destroy]

  # GET /gins
  def index
    @gins = Gin.order(gin_name: 'ASC')
  #include exposes associated botanicals and distllery in the json
    render json: @gins, include: ['botanicals', 'distillery']
  end

  # GET /gins/1
  def show
    render json: @gin, include: ['botanicals', 'distillery']
  end

  # POST /gins
  def create
    @gin = Gin.new(gin_params)

    if @gin.save
      render json: @gin, status: :created, location: @gin
    else
      render json: @gin.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gins/1
  def update
    if @gin.update(gin_params)
      render json: @gin
    else
      render json: @gin.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gins/1
  def destroy
    @gin.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gin
      @gin = Gin.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gin_params
      params.require(:gin).permit(:gin_name, :alcoholic, :snippet, :description, :abv, :distillery_id)
    end
end
