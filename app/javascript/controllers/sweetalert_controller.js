import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sweetalert"
export default class extends Controller {
  connect() {
    this.redirect = false;
  }

  createAlert() {
    Swal.fire({
      icon: 'success',
      title: 'Your property has been created!',
    }).then((result) => {
      if (result.isConfirmed) {
        this.redirect = true;
        this.element.click();
      }
    });
  }

  deleteAlert(event) {
    event.preventDefault();


    Swal.fire({
      title: 'Are you sure?',
      text: "You won't be able to revert this!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
      if (result.isConfirmed) {
        this.element.redirect();
      }
    });
  }
}
