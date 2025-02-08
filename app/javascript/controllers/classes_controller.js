import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.fetchClass();
  }

  fetchClass() {
    fetch("/classes")
      .then(response => response.json())
      .then(data => {
        document.getElementById("current-class").innerText = data.current_class;
      })
      .catch(error => console.error("Erreur de récupération de la classe:", error));
  }

  upgrade() {
    fetch("/classes/1", {
      method: "PATCH",
      headers: { "Content-Type": "application/json" }
    })
    .then(response => response.json())
    .then(data => {
      alert("Nouvelle classe: " + data.new_class);
      this.fetchClass();
    })
    .catch(error => console.error("Erreur lors de l'évolution de classe:", error));
  }
}
