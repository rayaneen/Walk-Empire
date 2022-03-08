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
    const from = turf.point([long, lat]);
    const to = turf.point([this.longitudeValue, this.latitudeValue]);
    const spaceBetween = turf.distance(from, to) * 1000;
    console.log(spaceBetween);
    if ((spaceBetween < 20) && (this.length > this.difficultyValue)) {
      this.update('Successful')}
    else if ((spaceBetween < 20) && (this.length < this.difficultyValue) ) {
      this.update('Failed')
    } else {
      window.setTimeout(this.beginItinary.bind(this), 5000)
    }
  }

  computeDistance() {
    if (this.itinaryCoords.length >= 2) {
      const line = turf.lineString(this.itinaryCoords);
      this.length = turf.length(line) * 1000;
      this.update()
      const value = document.createElement('pre');
      value.textContent = `Total distance: ${this.length.toLocaleString()}m`;
      this.distanceTarget.textContent = '';
      this.distanceTarget.appendChild(value);
    }
  }

  beginItinary() {
    navigator.geolocation.getCurrentPosition(this.getPosition.bind(this))
    this.computeDistance()
  }

  update(s) {
    this.formTarget.querySelector("#activity_itinary").value = JSON.stringify(this.itinaryCoords)
    this.formTarget.querySelector("#activity_distance").value = this.length
    this.formTarget.querySelector("#activity_status").value = s
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
