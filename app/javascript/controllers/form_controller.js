import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ['dropdownContent', 'btn']

  connect() {
  }

  openDropdown(form) {
      form.classList.remove('d-none')
    this.btnTarget.innerText = this.add_new(this.btnTarget.innerText)
  }

  closeDropdown(form) {
      form.classList.add('d-none')
    this.btnTarget.innerText = this.hide_btn(this.btnTarget.innerText)
  }

  toggle_btn(e){
    e.preventDefault()

  const form = this.dropdownContentTarget
  form.classList.contains('d-none') ?
      this.openDropdown(form) :
      this.closeDropdown(form)
  }

  add_new(str) {
    return str.replace('Add new', 'Hide');
  }

  hide_btn(str){
    return str.replace('Hide ', 'Add new ');
  }
}

