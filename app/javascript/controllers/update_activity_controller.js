import { Controller } from "@hotwired/stimulus"
import * as turf from '@turf/turf'

export default class extends Controller {

  static targets = ['form']

  connect() {
    this.itinaryCoords = []
    this.beginItinary();
  }
  getPosition(data) {
    const long = data.coords.longitude
    const lat = data.coords.latitude
    this.itinaryCoords.push([long, lat])
    console.log(this.itinaryCoords);
    window.setTimeout(this.beginItinary.bind(this), 5000)
  }

  computeDistance() {
    if (this.itinaryCoords.length >= 2) {
      const line = turf.lineString(this.itinaryCoords);
      this.length = turf.length(line) * 1000;
      console.log(this.length);
      this.update()
    }
  }

  beginItinary() {
    navigator.geolocation.getCurrentPosition(this.getPosition.bind(this))
    this.computeDistance()
  }

  update() {
    this.formTarget.querySelector("#activity_itinary").value = JSON.stringify(this.itinaryCoords)
    this.formTarget.querySelector("#activity_distance").value = this.length
    const body = new FormData(this.formTarget)
    const url = this.formTarget.action
    fetch(url, {
      method: 'PATCH',
      headers: { 'Accept': 'text/html' },
      body: body
    })
      .then(response => response.text())
      .then((data) => {
        console.log(data);
      })
  }

  // disconnect () {
  //   this.update()
  // }
}
