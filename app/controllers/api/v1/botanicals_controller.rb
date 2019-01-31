class Api::V1::BotanicalsController < ApplicationController
  before_action :set_botanical, only: [:show, :update, :destroy]

  # GET /botanicals
  def index
    @botanicals = Botanical.order(botanical_name: 'ASC')

    render json: @botanicals
  end

  # GET /botanicals/1
  def show
    render json: @botanical
  end

  # POST /botanicals
  def create
    @botanical = Botanical.new(botanical_params)

    if @botanical.save
      render json: @botanical, status: :created, location: @botanical
    else
      render json: @botanical.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /botanicals/1
  def update
    if @botanical.update(botanical_params)
      render json: @botanical
    else
      render json: @botanical.errors, status: :unprocessable_entity
    end
  end

  # DELETE /botanicals/1
  def destroy
    @botanical.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_botanical
      @botanical = Botanical.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def botanical_params
      params.require(:botanical).permit(:botanical_name, :snippet, :description, :abv, :slug)
    end
end
