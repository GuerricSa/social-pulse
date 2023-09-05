import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="friends"
export default class extends Controller {
  static targets = ["followBtn", "tab1", "tab2", "tab1Content", "tab2Content"]

  static values = {
    userId: Number
  }

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

  tab1(event) {
    event.target.classList.add("active");
    this.tab2Target.classList.remove("active");
    this.tab1ContentTarget.classList.remove("d-none");
    this.tab2ContentTarget.classList.add("d-none");
  }

  tab2(event) {
    event.target.classList.add("active");
    this.tab1Target.classList.remove("active");
    this.tab1ContentTarget.classList.add("d-none");
    this.tab2ContentTarget.classList.remove("d-none");
  }
}
