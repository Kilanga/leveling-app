class AchievementsController < ApplicationController
  def index
    achievements = current_user.achievements.where(unlocked: true)
    render json: { achievements: achievements }
  end
end
