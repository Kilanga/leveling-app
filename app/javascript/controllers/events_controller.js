import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.fetchEvents();
  }

  fetchEvents() {
    fetch("/events")
      .then(response => response.json())
      .then(data => {
        const eventList = document.getElementById("event-list");
        eventList.innerHTML = "";
        data.events.forEach(event => {
          let li = document.createElement("li");
          li.innerHTML = ;
          eventList.appendChild(li);
        });
      })
      .catch(error => console.error("Erreur de récupération des événements:", error));
  }
}
