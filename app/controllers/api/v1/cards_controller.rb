module Api
  module V1
    class CardsController < ApiController
      # GET /v1/boards/{id}/list/{id}/cards
      def index
        render json: @current_v1_user.boards.find(params[:board_id]).lists.find(params[:list_id]).cards
      end

      # GET /v1/boards/{id}/list/{id}/cards/{id}
      def show
        render json: @current_v1_user.boards.find(params[:board_id]).lists.find(params[:list_id]).cards.find(params[:card_id])
      end

      # POST /v1/boards/{id}/list/{id}/cards
      def create
        list = @current_v1_user.boards.find(params[:board_id]).lists.find(params[:list_id])
        (redner json: { error: "Board or List could not be found" }, status: 404 && return) if list.nil?
        pa = params.require(:card).permit(:title, :description)
        pa[:list_id] = list.id
        card = Card.new(pa)
        if card.save
          render json: card
        else
          render json: { error: "Could not create card" }, status: 400
        end
      end

      # DELETE /v1/boards/{id}/list/{id}/cards
      def destroy
        card = @current_v1_user.boards.find(params[:board_id]).lists.find(params[:list_id]).cards.find(params[:card_id])
        if card.nil?
          render json: { error: "Could not find card" }, status: 404
        else
          card.destroy!
          render json: { status: :ok }
        end

      end
    end
  end
end
