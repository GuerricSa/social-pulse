import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notifications"
export default class extends Controller {
  static values = {
    notificationId: Number
  }

  static targets = [ "bouton" ]

  mark_as_read(event) {
    event.preventDefault();
    this.element.classList.remove("unread");
    event.target.classList.add("d-none");
    const url = this.element.querySelector("form").action;
    fetch(url, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.element.querySelector("form"))
    })
    .then(response => response.text())
  }
}
