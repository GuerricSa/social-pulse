import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="friends"
export default class extends Controller {
  static targets = ["follow", "unfollow"]

  connect() {
  }

  follow(event) {
    this.followTarget.classList.add("d-none");
    this.unfollowTarget.classList.remove("d-none");
  }

  unfollow(event) {
    this.followTarget.classList.remove("d-none");
    this.unfollowTarget.classList.add("d-none");
  }

}
