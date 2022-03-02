import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    id: String,
  }
  revealinfos() {
    console.log(`Hola que tal ${this.idValue}`)
  }
}
