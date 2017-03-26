module Api
  module V1
    class ListsController < ApiController
      # GET /v1/board/{id}/lists
      def index
        render json: @current_v1_user.boards.find(params[:board_id]).lists
      end

      # GET /v1/board/{id}/lists/{id}
      def show
        render json: @current_v1_user.boards.find(params[:board_id]).lists.find(params[:list_id])
      end

      def create
        board = @current_v1_user.boards.find(params[:board_id])
        render json: { error: "Board could not be found" }, status: 404 if board.nil?
        pa = params.require(:list).permit(:title, :description)
        pa[:board_id] = params[:board_id]
        list = List.new(pa)
        if list.save
          render json: list
        else
          render json: { error: "Could not create list" }, status: 400
        end
      end

      def destroy
        list = @current_v1_user.boards.find(params[:board_id]).lists.find(params[:list_id])
        if list.nil?
          render json: { error: "Could not find list" }, status: 404
        else
          list.destroy!
          render json: { status: :ok }
        end
      end
    end
  end
end
