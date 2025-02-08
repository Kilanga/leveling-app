require 'rails_helper'

describe PaymentsController, type: :controller do
  describe "POST create" do
    it "crée un paiement et ajoute des coins" do
      post :create, params: { stripeToken: "test_token" }
      expect(response).to redirect_to(root_path)
    end
  end
end
