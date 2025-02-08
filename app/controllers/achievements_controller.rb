class AchievementsController < ApplicationController
  ACHIEVEMENTS = [
    { id: 1, title: "Premiers pas", condition: "Atteindre le niveau 5" },
    { id: 2, title: "Aventurier aguerri", condition: "Terminer 10 quêtes" },
    { id: 3, title: "Maître des classes", condition: "Évoluer en classe avancée" }
  ]

  def index
    user = FirebaseService.get_user(1) # Remplacer par utilisateur connecté
    unlocked_achievements = ACHIEVEMENTS.select do |ach|
      case ach[:id]
      when 1 then user.data["level"] >= 5
      when 2 then user.data["quests_completed"] >= 10
      when 3 then user.data["class"] != "Novice"
      else false
      end
    end
    render json: { achievements: unlocked_achievements }
  end
end
