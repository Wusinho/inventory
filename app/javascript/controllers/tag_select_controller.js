import { Controller } from "@hotwired/stimulus"
import Tags from "bootstrap5-tags"

// Connects to data-controller="tag-select"
export default class extends Controller {
  connect() {
    Tags.init("select[data-controller='tag-select']")
  }
}
