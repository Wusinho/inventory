import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="update-customer-payment"
export default class extends Controller {
  connect() {
  }
  click(event){
    const sellingOrder = event.currentTarget
    const id = sellingOrder.dataset.id
    const csrtToken = document.querySelector('meta[name="csrf-token"]').content
    fetch(`/selling_orders/${id}`, {
      method: 'Put',
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrtToken
      },
      body: JSON.stringify({ paid: true })
    }).then(r => r.text())
        .then(html =>{
          console.log(html)
        } )
  }

}
