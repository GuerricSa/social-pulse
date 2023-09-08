import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"

// Connects to data-controller="register"
export default class extends Controller {
  static values = {
    icon: String,
    alertTitle: String,
    alertHtml: String,
    confirmButtonText: String,
    showCancelButton: Boolean,
    cancelButtonText: String
  }

  initSweetalert(event) {
    event.preventDefault(); // Prevent the form to be submited after the submit button has been clicked

    Swal.fire({
      title: 'Confirmes-tu ta participation ?',
      showDenyButton: true,
      showCancelButton: false,
      confirmButtonText: 'Je confirmes ma participation',
      denyButtonText: `Annuler`,
    }).then((action) => {
      /* Read more about isConfirmed, isDenied below */
      if (action.isConfirmed) {
        Swal.fire('Ta participation est enregistrée !', '', 'success')
        event.target[event.type]();
      } else if (action.isDenied) {
        Swal.fire('Aucune participation enregistrée', '', 'info')
      }
    })
    .catch(event.preventDefault())

    // Swal.fire({
    //   icon: this.iconValue,
    //   title: this.titleValue,
    //   html: this.htmlValue,
    //   confirmButtonText: this.confirmButtonTextValue,
    //   showCancelButton: this.showCancelButtonValue,
    //   cancelButtonText: this.cancelButtonTextValue,
    //   reverseButtons: true
    // }).then((action) => {
    //   if (action.isConfirmed) {
    //     event.target[event.type](); // "submit"
    //   }
    // })
    // .catch(event.preventDefault())
  }
}
