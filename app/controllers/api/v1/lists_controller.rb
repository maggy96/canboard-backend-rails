module Api
  module V1
    class ListsController < ApiController
      # GET /v1/board/{id}/lists
      def index
        render json: @current_v1_user.board.find(params[board_id]).lists
      end

      # GET /v1/board/{id}/lists/{id}
      def show
        render json: @current_v1_user.board.find(params[board_id]).lists.find(params[list_id])
      end
    end
  end
end
