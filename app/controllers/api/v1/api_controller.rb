module Api::V1
  class ApiController < ApplicationController
    respond_to :json
    before_action :authenticate_v1_user!
  end
end
