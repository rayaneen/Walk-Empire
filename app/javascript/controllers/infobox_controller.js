import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["infos"]

  revealInfos(event) {
    const baseUrl = window.location.origin
    const url = `${baseUrl}/control_points/${event.detail.id}`
    fetch(url)
      .then(response => response.text()
      .then(this.displayData)
      )
  }

  hiddenData = () => {
    this.infosTarget.innerHTML = '';
    this.infosTarget.classList.remove('opened')
  }
  displayData = (data) => {
    this.infosTarget.innerHTML = data;
    this.infosTarget.classList.add('opened')
  }
}
