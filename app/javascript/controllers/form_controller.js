import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ['dropdownContent', 'btn']
  static values = { open: Boolean }
  connect() {
    this.toggle(this.openValue)
  }

  toggle(value){
    if (value === true) {
      this.openDropdown()
    } else {
      this.closeDropdown()
    }
  }

  openDropdown() {
    this.dropdownContentTarget.hidden = !this.openValue
  }

  closeDropdown() {
    this.dropdownContentTarget.hidden = !this.openValue
  }

  toggle_btn(e){
    e.preventDefault()
    this.openValue = !this.openValue
    this.toggle(this.openValue)
  }
}
