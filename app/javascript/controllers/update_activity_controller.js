import { Controller } from "@hotwired/stimulus"
import * as turf from '@turf/turf'


export default class extends Controller {
  static targets = ['form', 'distance']
  static values = {
    itinary: Array,
    distance: Number,
    longitude: Number,
    latitude: Number,
    difficulty: Number,
  }
  connect() {
    console.log(this);
    console.log(this.itinaryValue);

    this.itinaryCoords = this.itinaryValue
    this.length = this.distanceValue || 0
    this.beginItinary();
  }
  getPosition(data) {
    const long = data.coords.longitude
    const lat = data.coords.latitude
    this.itinaryCoords.push([long, lat])
    window.setTimeout(this.beginItinary.bind(this), 2000)
  }

  computeDistance() {
    if (this.itinaryCoords.length >= 2) {
      const line = turf.lineString(this.itinaryCoords);
      this.length = turf.length(line) * 1000;
      this.update()
      const value = document.createElement('pre');
      value.textContent = `${this.length.toLocaleString()} m walked`;
      this.distanceTarget.textContent = '';
      this.distanceTarget.appendChild(value);
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
    console.log(body)
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
