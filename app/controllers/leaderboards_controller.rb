class LeaderboardsController < ApplicationController
  def index
    users = FirebaseService.get_all_users.sort_by { |u| -u["xp"] }.first(10)
    render json: { leaderboard: users.map { |u| { name: u["display_name"], xp: u["xp"] } } }
  end
end
