import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="open-form"
export default class extends Controller {
  connect() {
  }

  click(e){
    console.log('clicked')
  }
}
