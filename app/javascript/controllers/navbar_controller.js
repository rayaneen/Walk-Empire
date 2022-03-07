import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "showProfil" ]

  showProfil() {
    this.showProfilTarget.classList = ""
  }
  hideProfil() {
    this.hideProfilTarget.classlist = "close"
  }
}
