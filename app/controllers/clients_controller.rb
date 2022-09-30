class ClientsController < ApplicationController
    def index
        render json: Client.all, status: :ok
    end

    def show
        render json: Client.find(params[:id]), status: :ok
    end

    def update
        render json: Client.find(params[:id]).update!(client_params), status: :ok
    end

    private

    def client_params
        params.permit()
    end
end
