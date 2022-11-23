import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edu"
export default class extends Controller {
  connect() {
    console.log("Hello Edu")
  }


  text() {
    console.log("hello")
  }
}
