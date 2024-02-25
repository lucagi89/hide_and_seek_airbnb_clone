import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bookings"
export default class extends Controller {
  static targets = ["status"]

  approve(event) {
    this.statusTarget.dataset.bookings = true
  }
}
