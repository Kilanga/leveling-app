import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.fetchAchievements();
  }

  fetchAchievements() {
    fetch("/achievements")
      .then(response => response.json())
      .then(data => {
        const achievementList = document.getElementById("achievement-list");
        achievementList.innerHTML = "";
        data.achievements.forEach(ach => {
          let li = document.createElement("li");
          li.innerHTML = ;
          achievementList.appendChild(li);
        });
      })
      .catch(error => console.error("Erreur de récupération des succès:", error));
  }
}
