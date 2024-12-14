require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /login" do
    it "returns http success" do
      get "/login"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /login" do
    it "returns http success" do
      post "/login", params: { id: 1 }

      expect(response).to redirect_to(root_path)
      expect(session[:user_id]).to eq(1)
      expect(User.find(1)).to be_present
    end
  end

  describe "DELETE /logout" do
    before do
      post "/login", params: { id: 1 }
    end

    it "returns http success" do
      expect(session[:user_id]).to eq(1)

      delete "/logout"

      expect(response).to redirect_to(root_path)
      expect(session[:user_id]).to be_nil
      expect(User.find_by(id: 1)).to be_present
    end
  end
end
