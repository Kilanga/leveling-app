class QuestsController < ApplicationController
  before_action :authenticate_user!
  def index
    quests = current_user.quests.where(completed: false)
    render json: { quests: quests }
  end

  def update
    quest = current_user.quests.find(params[:id])
    quest.update(completed: true)
    current_user.increment!(:xp, quest.xp_reward)
    render json: { message: "Quête complétée", xp_gained: quest.xp_reward }
  end
end
