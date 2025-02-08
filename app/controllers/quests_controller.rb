class QuestsController < ApplicationController
  def index
    quests = [
      { id: 1, title: "Faire 10 pompes" },
      { id: 2, title: "Lire un chapitre d'un livre" },
      { id: 3, title: "Marcher 5000 pas" }
    ]
    render json: { quests: quests }
  end

  def update
    user = FirebaseService.get_user(params[:id])
    new_xp = user.data["xp"] + 50
    FirebaseService.update_user_xp(user.data["uid"], new_xp)
    render json: { message: "Quête accomplie!", xp: 50 }
  end
end
