require 'rails_helper'

RSpec.describe "SellingOrders", type: :request do
  describe "GET /update" do
    it "returns http success" do
      get "/selling_orders/update"
      expect(response).to have_http_status(:success)
    end
  end

end
