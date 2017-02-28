module Api::V1
  class ApiController < ApplicationController
    before_action :authenticate_v1_user!
  end
end
