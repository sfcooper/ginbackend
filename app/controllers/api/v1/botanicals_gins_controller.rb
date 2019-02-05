class Api::V1::BotanicalsGinsController < ApplicationController
  before_action :set_botanicals_gin, only: [:show, :update, :destroy]

  # GET /gins
  def index
    @botanicals_gins = BotanicalsGin.all

    render json: @botanicals_gins
  end

  # GET /gins/1
  def show
    render json: @botanicals_gin
  end

  # POST /gins
  def create
    @botanicals_gin = BotanicalsGin.new(botanicals_gin_params)

    if @botanicals_gin.save
      render json: @botanicals_gin, status: :created, location: @botanicals_gin
    else
      render json: @botanicals_gin.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gins/1
  def update
    if @botanicals_gin.update(botanicals_gin_params)
      render json: @botanicals_gin
    else
      render json: @botanicals_gin.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gins/1
  def destroy
    @botanicals_gin.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_botanicals_gin
      @botanicals_gin = BotanicalsGin.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gin_params
      params.require(:botanicals_gins).permit(:distillery_id, :gin_id)
    end
end
