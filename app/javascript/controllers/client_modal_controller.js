import { Controller } from "@hotwired/stimulus"

const clientsRoute = "/clients"

// Connects to data-controller="client-modal"
export default class extends Controller {

  connect() {
    this.element.addEventListener("turbo:submit-end", (event) => {
      if (event.detail.success) {
        Turbo.visit(event.detail.fetchResponse.response.url)
      }
    })
  }

  hideModal() {
    this.element.parentElement.removeAttribute("src") // it might be nice to also remove the modal SRC
    this.element.remove()
    Turbo.visit(clientsRoute)
  }
}
