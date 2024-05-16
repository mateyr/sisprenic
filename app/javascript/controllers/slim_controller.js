import { Controller } from "@hotwired/stimulus"
import SlimSelect from 'slim-select'

export default class extends Controller {
  connect() {

    const showSearch = this.element.dataset.showsearch === "true"

    this.select = new SlimSelect({
      select: this.element,
      settings: {
        showSearch: showSearch,
        searchPlaceholder: "Buscar",
      },
    })
  }
}

// For future modifications concerning the border and focus event
/* import { Controller } from "@hotwired/stimulus"
import SlimSelect from 'slim-select'

export default class extends Controller {

  connect() {
    // Instancia para el primer select con búsqueda

    // debugger
    const showSearch = this.element.dataset.showsearch === "true"

    // this.element.addEventListener("click", () => {
    //   console.log("Hello World")
    // });

    this.slimWithSearch = new SlimSelect({
      select: this.element,
      settings: {
        showSearch: showSearch,
        searchPlaceholder: "Buscar"
      },
      events: {
        afterOpen: () => {
          // debugger
          console.log('Just Open');
          document.getElementsByClassName("fijo")[1].click();
        },
      }
    })
  }
} */
