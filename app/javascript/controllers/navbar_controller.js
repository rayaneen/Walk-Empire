import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "profil" ]

  displayProfil() {
    this.profilTarget.classList.toggle("opened2")
  }


}
