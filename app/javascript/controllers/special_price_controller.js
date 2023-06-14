import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="special-price"
export default class extends Controller {
  static targets = ['discount_price']
  connect() {
  }

  toggle(e) {
    const switch_discount = e.target.checked
    const price = this.discount_priceTarget
    switch_discount ? this.openDropdown(price) : this.closeDropdown(price)
  }

  openDropdown(div) {
    div.classList.remove('d-none')
  }

  closeDropdown(div) {
    div.classList.add('d-none')
  }

}
