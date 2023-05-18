import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ['dropdownContent', 'btn']
  connect() {
    // this.toggle(this.openValue)
  }

  toggle_btn(e){
    e.preventDefault()

  const form = this.dropdownContentTarget
  form.classList.length > 0 ?
      form.classList.remove('d-none') :
      form.classList.add('d-none')

  }
}
