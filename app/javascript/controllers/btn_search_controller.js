import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="btn-search"
export default class extends Controller {
  static targets = ['searchbtns']
  connect() {
  }

  toggle(e){
    const focused_btns = this.searchbtnsTargets
    focused_btns.forEach((ele)=> {
      ele.classList.remove('disabled')
    })
    e.target.classList.add('disabled')
    console.log(e.target.classList)
  }
}
