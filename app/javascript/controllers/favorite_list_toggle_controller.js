import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorite-list-toggle"
export default class extends Controller {
  static targets = ["toggleable"]
  connect() {
    console.log("controller is enabled")
  }
  toggleCard(event) {
    console.log('toggling card')
    const card = event.currentTarget;
    const toggleable = card.querySelector("[data-favorite-list-toggle-target='toggleable']");
    toggleable.classList.toggle("d-none");
  }
}
