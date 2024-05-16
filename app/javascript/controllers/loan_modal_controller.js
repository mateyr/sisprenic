import { Controller } from "@hotwired/stimulus"

const loansRoute = "/loans"

// Connects to data-controller="loan-modal"
export default class extends Controller {

  connect() {
    this.element.addEventListener("turbo:submit-end", (event) => {
      if (event.detail.success) {
        Turbo.visit(event.detail.fetchResponse.response.url)
      }
    })
  }

  hideModal() {
    this.element.parentElement.removeAttribute("src")
    this.element.remove()
    Turbo.visit(loansRoute)
  }
}
