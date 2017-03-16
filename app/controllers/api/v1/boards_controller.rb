module Api
  module V1
    class BoardsController < ApiController
      # GET /v1/boards
      def index
        render json: @current_v1_user.boards
      end

      # GET /v1/boards/{id}
      def show
        render json: @current_v1_user.boards.where(id: params[:id])
      end

      # POST /v1/boards
      def create
        board = Board.new(params.require(:board).permit(:title, :description))
        board.user = @current_v1_user
        if board.save
          render json: board
        else
          render json: { error: "Could not create board" }, status: 400
        end
      end
    end
  end
end
