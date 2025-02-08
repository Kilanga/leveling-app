import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.fetchUserData();
    this.fetchQuests();
    this.fetchShopItems();
  }

  fetchUserData() {
    fetch("/users/1")
      .then(response => response.json())
      .then(data => {
        document.getElementById("display-name").innerText = data.user.display_name;
        document.getElementById("user-level").innerText = data.user.level;
        document.getElementById("user-xp").innerText = data.user.xp;
        document.getElementById("xp-to-next-level").innerText = data.user.xp_to_next_level;
        document.getElementById("user-coins").innerText = data.user.coins;
      })
      .catch(error => console.error("Erreur de récupération des données utilisateur:", error));
  }

  fetchQuests() {
    fetch("/quests")
      .then(response => response.json())
      .then(data => {
        const questList = document.getElementById("quest-list");
        questList.innerHTML = "";
        data.quests.forEach(quest => {
          let li = document.createElement("li");
          li.innerHTML = `${quest.title} - <button data-action='click->dashboard#completeQuest' data-id='${quest.id}'>Accomplir</button>`;
          questList.appendChild(li);
        });
      })
      .catch(error => console.error("Erreur de récupération des quêtes:", error));
  }

  fetchShopItems() {
    fetch("/shop")
      .then(response => response.json())
      .then(data => {
        const shopList = document.getElementById("shop-list");
        shopList.innerHTML = "";
        data.items.forEach(item => {
          let li = document.createElement("li");
          li.innerHTML = `${item.name} - ${item.price} coins <button data-action='click->dashboard#purchaseItem' data-id='${item.id}'>Acheter</button>`;
          shopList.appendChild(li);
        });
      })
      .catch(error => console.error("Erreur de récupération de la boutique:", error));
  }

  purchaseItem(event) {
    const itemId = event.target.dataset.id;
    fetch(`/shop/purchase`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ item_id: itemId })
    })
    .then(response => response.json())
    .then(data => {
      alert("Achat réussi!");
      this.fetchUserData();
    })
    .catch(error => console.error("Erreur lors de l'achat:", error));
  }
}