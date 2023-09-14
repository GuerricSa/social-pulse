import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"

// Connects to data-controller="register"
export default class extends Controller {
  static values = {
    activityId: String
  }

  static targets = ["bouton"]

  initSweetalert(event) {
    event.preventDefault(); // Prevent the form to be submited after the submit button has been clicked
    // console.log();
    Swal.fire({
      customClass: {
        popup: 'register-popup',
        icon: 'register-icon',
        title: 'register-title',
        htmlContainer: 'register-text',
        icon: 'register-icon',
        actions: 'register-buttons'
      },
      title: 'Confirmes-tu ta participation ?',
      text: "La personne qui propose cette activité sera avertie de ta participation.",
      icon: 'question',
      showCancelButton: true,
      // confirmButtonColor: '#3085d6',
      // cancelButtonColor: '#d33',
      confirmButtonText: 'Oui, je confirme',
      cancelButtonText: 'Annuler'
    }).then((result) => {
      if (result.isConfirmed) {
        event.target[event.type]();
        this.boutonTarget.value = "J'annule ma participation";
        Swal.fire(
          'Incription validée !',
          "Ta participation a bien été enregistrée.",
          'success'
        );
      }
    })
    .catch(event.preventDefault());
  }
}
