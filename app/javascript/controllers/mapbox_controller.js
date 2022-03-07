import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/rootmyzh/cl0b1wrfj006t15mundi6l86n",
      // style: "mapbox://styles/rootmyzh/cl09qmnvi001p14o0u0ugpjtl"
      zoom: 30
    })
    const geolocate = new mapboxgl.GeolocateControl({
      positionOptions: {enableHighAccuracy: false},
      trackUserLocation: true
      });
    this.map.addControl(geolocate);
    this.map.on('load', () => {
    geolocate.trigger();
    });
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
      const el = document.createElement("div");
      el.setAttribute('data-controller', 'marker');
      el.setAttribute('data-marker-id-value', marker.id);
      el.setAttribute('data-action', 'click->marker#broadcastEvent')
      el.className = 'marker';
      if (marker.user_id == marker.control_point_user_id) {
        el.classList.add("owned")
        el.classList.remove("unowned")
      } else if (marker.admin == true) {
        el.classList.remove("unowed")
        el.classList.remove("owned")
      } else {
        el.classList.add("unowned")
        el.classList.remove("owned")
      }
      new mapboxgl.Marker(el)
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map)
    });
  }
  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
