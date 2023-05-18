import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ['dropdownContent', 'btn']
  static values = { open: Boolean }
  connect() {
    // this.toggle(this.openValue)
  }

  toggle(value){
    if (value === true) {
      this.openDropdown()
    } else {
      this.closeDropdown()
    }
  }

  openDropdown() {
    try {
      this.dropdownContentTarget.classList.remove('d-none')
    }
    catch {
    }
  }

  closeDropdown() {
    try{
      this.dropdownContentTarget.classList.add('d-none')
    }catch {}
  }

  toggle_btn(e){
    e.preventDefault()
    this.openValue = !this.openValue
    this.toggle(this.openValue)
  }
}
