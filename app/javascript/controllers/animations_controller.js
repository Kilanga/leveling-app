import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.fetchAnimations();
  }

  fetchAnimations() {
    fetch("/animations")
      .then(response => response.json())
      .then(data => {
        const animationList = document.getElementById("animation-list");
        animationList.innerHTML = "";
        data.animations.forEach(anim => {
          let li = document.createElement("li");
          li.innerHTML = `<strong>${anim.title}</strong>: ${anim.description}`;
          animationList.appendChild(li);
        });
      })
      .catch(error => console.error("Erreur de récupération des animations:", error));
  }
}