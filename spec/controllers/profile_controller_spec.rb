require 'rails_helper'

RSpec.describe ProfileController, type: :controller do

  describe "GET #update_basic" do
    it "returns http success" do
      get :update_basic
      expect(response).to have_http_status(:success)
    end
  end

end
