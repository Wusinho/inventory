import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="product-form"
export default class extends Controller {
  connect() {
  }
  toggle(e) {
    e.preventDefault()
    const form = document.getElementById('product_form')

    form.classList.length > 0 ?
        form.classList.remove('d-none') :
        form.classList.add('d-none')

  }
}
