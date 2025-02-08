import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.fetchLeaderboard();
  }

  fetchLeaderboard() {
    fetch("/leaderboards")
      .then(response => response.json())
      .then(data => {
        const leaderboardList = document.getElementById("leaderboard-list");
        leaderboardList.innerHTML = "";
        data.leaderboard.forEach(player => {
          let li = document.createElement("li");
          li.innerHTML = ;
          leaderboardList.appendChild(li);
        });
      })
      .catch(error => console.error("Erreur de récupération du classement:", error));
  }
}
