import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="friends"
export default class extends Controller {
  static targets = ["followBtn"]

  connect() {
  }

  follow() {
    if (this.followBtnTarget.innerText == "Suivi(e)") {
      this.followBtnTarget.innerText = "Suivre"
    } else {
      this.followBtnTarget.innerText = "Suivi(e)"
    }
    // il faut rajouter la méthode pour ajouter l'user id à la table friends
  }

  report() {
    // il faut rajouter la méthode pour aller vers le formulaire de signalement
  }

}
