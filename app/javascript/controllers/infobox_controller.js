import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["infos"]

  revealInfos(event) {
    console.log(event.detail.id)
    const url = `control_points/${event.detail.id}`
    fetch(url)
      .then(response => response.text()
      .then(this.displayData)
      )
  }
  displayData = (data) => {
    this.infosTarget.innerHTML = data;
    this.infosTarget.classList.add('opened')
  }
}
