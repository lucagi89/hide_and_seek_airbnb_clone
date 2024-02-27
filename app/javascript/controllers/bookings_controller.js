import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bookings"
export default class extends Controller {
  static targets = ["status", "form"]

  approve(event) {
    event.preventDefault();
    const form = event.currentTarget;
    const formData = new FormData(form);

    fetch(form.action, {
      method: form.method,
      body: formData,
      headers: {
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      }
    }).then(response => {
      if (response.ok) {
        // Handle successful response if needed
        console.log("Booking approved successfully!");
      } else {
        // Handle error response if needed
        console.error("Failed to approve booking");
      }
    }).catch(error => {
      console.error("Error occurred while approving booking:", error);
    });
  }
}
