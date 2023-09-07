import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorites"
export default class extends Controller {
  static targets = ["heart"]

  connect() {
  }

  toggleColor() {
    this.heartTarget.classList.toggle("fa-solid");
    this.heartTarget.classList.toggle("fa-regular");
  }
}
// console.log("hello")
