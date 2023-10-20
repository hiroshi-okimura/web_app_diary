import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toast"
export default class extends Controller {
  static targets = ["closeButton", "toast"];

  connect() {
  }

  close() {
    this.toastTarget.style.display = "none";
  }
}
