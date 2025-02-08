require 'rails_helper'

describe LeaderboardsController, type: :controller do
  describe "GET index" do
    it "retourne une liste des 10 meilleurs joueurs" do
      get :index
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json['leaderboard']).to be_an(Array)
    end
  end
end
