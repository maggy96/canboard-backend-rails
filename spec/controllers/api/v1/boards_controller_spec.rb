require 'spec_helper'

describe Api::V1::BoardsController do
  describe "GET #show" do
    before(:each) do
      @user = FactoryGirl.create :user
      @board = FactoryGirl.create :board
      auth_headers = @user.create_new_auth_token
      request.headers.merge!(auth_headers)
      get :show, params: { id: @user.id }
    end

    it 'responds with 200 status code' do
      expect(response.code).to eq('200')
    end

    it 'returns the serialized board attributes' do
      expect(JSON.parse(response.body)['data'][0]['attributes']).to eq(
        {"title" => "Project: Exit Matrix", 
         "description" => "Follow the white rabbit",
         "cards" => [] })
    end
  end
end
