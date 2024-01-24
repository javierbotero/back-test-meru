require 'rails_helper'

RSpec.describe "Tokens", type: :request do
  let(:response_data) { JSON.parse(response.body, symbolize_names: true) }

  describe "POST /create" do
    it "returns http success" do
      post tokens_path

      expect(response).to have_http_status(:success)
      expect(['token']).to be_present
      expect(Token.find_by(token: response_data[:token])).to be_present
    end
  end
end
