module Api::V1
  class CardsController < ApiController

    # GET /v1/boards/{id}/cards
    def index
      render json: @current_v1_user.boards.find(params[:board_id]).cards
    end

    # GET /v1/boards/{id}/cards/{id}
    def show
      render json: @current_v1_user.boards.find(params[:board_id]).cards.find(params[:card_id])
    end

  end
end
