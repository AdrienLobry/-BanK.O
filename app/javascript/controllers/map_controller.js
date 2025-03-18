// app/javascript/controllers/map_controller.js
import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    // Set Mapbox access token
    mapboxgl.accessToken = this.apiKeyValue

    // Initialize the Mapbox map
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/frenchdrinker/cm8e8x3r7000801sd1i0j80pq"
    })

    // Add custom markers to the map
    this.#addMarkersToMap()

    // Adjust the map view to fit all markers
    this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      marker = typeof marker === "string" ? JSON.parse(marker) : marker

      // Create the marker container
      const markerContainer = document.createElement("div")
      markerContainer.className = "custom-marker" // Apply CSS styles

      // Create the image inside the marker
      const markerImage = document.createElement("div")
      markerImage.className = "marker-image"
      markerContainer.appendChild(markerImage)

      // Create and add the custom marker to the map
      new mapboxgl.Marker(markerContainer)
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()

    this.markersValue.forEach((marker) => {
      marker = typeof marker === "string" ? JSON.parse(marker) : marker
      bounds.extend([marker.lng, marker.lat])
    })

    if (this.markersValue.length > 0) {
      this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
    }
  }
}
