import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="progress"
export default class extends Controller {
  connect() {
    console.log("Hello")
  }
}
