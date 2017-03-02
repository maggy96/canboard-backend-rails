module Api::V1
  class BoardsController < ApiController

    # GET /v1/boards
    def index
      render json: current_v1_user.boards
    end

    # GET /v1/boards/{id}
    def show
      render json: Board.find(params[:id])
    end

  end
end
