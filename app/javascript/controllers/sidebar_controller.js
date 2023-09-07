import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar"
export default class extends Controller {
  static targets = ["bar", "background"]
  open(event) {
    event.preventDefault()
    this.barTarget.classList.add("active")
    this.backgroundTarget.classList.remove("d-none")
  }
  close(event) {
    event.preventDefault()
    this.barTarget.classList.remove("active")
    this.backgroundTarget.classList.add("d-none")
  }
}
