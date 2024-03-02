import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="description"
export default class extends Controller {
  static targets = ["dots", "more", "readMoreBtn"];

  toggle() {
    this.dotsTarget.style.display = (this.dotsTarget.style.display === "none") ? "inline" : "none";
    this.moreTarget.style.display = (this.moreTarget.style.display === "none") ? "inline" : "none";
    this.readMoreBtnTarget.textContent = (this.readMoreBtnTarget.textContent === "Read more") ? "Read less" : "Read more";
  }
}
