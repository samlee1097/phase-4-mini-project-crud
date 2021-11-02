class SpicesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index
        render json: Spice.all, status: :ok
    end

    def create
        spice = Spice.create(spices_params)
        render json: spice, status: :created
    end

    def  update
        spice = Spice.find_by(id: params[:id])
        spice.update(spices_params)
        render json: spice, status: :accepted
    end

    def destroy
        spice = Spice.find_by(id: params[:id])
        spice.destroy
        head :no_content
    end

    private

    def spices_params
        params.permit(:title,:image,:description,:notes,:rating)
    end

    def render_not_found
        render json: {error: "Spice not found"}, status: :not_found
    end
end
