import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="friends"
export default class extends Controller {
  static targets = ["followBtn"]

  connect() {
  }

  follow() {
    if (this.followBtnTarget.innerHTML == "<p><i class='fa-solid fa-heart'></i> Suivi(e)</p>") {
      this.followBtnTarget.innerHTML = "<p><i class='fa-regular fa-heart'>Suivre</p>"
    } else {
      this.followBtnTarget.innerHTML = "<p><i class='fa-solid fa-heart'></i> Suivi(e)</p>"
    }
  }

  report() {
    // il faut rajouter la méthode pour aller vers le formulaire de signalement
  }

}
