import { Controller } from "@hotwired/stimulus"
import { getAuth, signInWithPopup, GoogleAuthProvider } from "firebase/auth"
import { initializeApp } from "firebase/app"

export default class extends Controller {
  connect() {
    const firebaseConfig = {
      apiKey: "YOUR_API_KEY",
      authDomain: "YOUR_AUTH_DOMAIN",
      projectId: "YOUR_PROJECT_ID",
      storageBucket: "YOUR_STORAGE_BUCKET",
      messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
      appId: "YOUR_APP_ID"
    };
    
    this.app = initializeApp(firebaseConfig);
    this.auth = getAuth(this.app);
  }

  login() {
    const provider = new GoogleAuthProvider();
    signInWithPopup(this.auth, provider)
      .then((result) => {
        result.user.getIdToken().then(token => {
          fetch("/sessions", {
            method: "POST",
            headers: {
              "Content-Type": "application/json"
            },
            body: JSON.stringify({ token })
          })
          .then(response => response.json())
          .then(data => console.log(data));
        });
      })
      .catch(error => console.error(error));
  }
}
