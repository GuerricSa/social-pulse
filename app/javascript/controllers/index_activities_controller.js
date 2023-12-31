import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="index-activities"
export default class extends Controller {
  static targets = ["tab1", "tab2", "tab1Content", "tab2Content"]

  connect() {
  }

  tab1(event) {
    event.target.classList.add("active");
    this.tab2Target.classList.remove("active");
    this.tab1ContentTarget.classList.remove("d-none");
    this.tab2ContentTarget.classList.add("behind");
  }

  tab2(event) {
    event.target.classList.add("active");
    this.tab1Target.classList.remove("active");
    this.tab1ContentTarget.classList.add("d-none");
    this.tab2ContentTarget.classList.remove("behind");
  }
}
