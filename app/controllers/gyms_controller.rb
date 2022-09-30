class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_handler
    def index
        render json: Gym.all, status: :ok
    end

    def show
        render json: Gym.find(params[:id]), status: :ok
    end

    def update
        render json: Gym.find(params[:id]).update!(gym_params), status: :ok
    end

    def destroy
        Gym.find(params[:id]).destroy
        head :no_content
    end

    private

    def gym_params
        params.permit(:name, :address)
    end

    def record_not_found_handler
        render json: {error: "Gym not found"}, status: :not_found
    end
end
