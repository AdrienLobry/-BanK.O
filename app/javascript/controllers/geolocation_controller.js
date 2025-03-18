import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["inputCity"];

  connect() {
  }

  getLocation(event) {
    event.preventDefault();
    const accessToken = window.MAPBOX_ACCESS_TOKEN;

    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        (position) => this.showPosition(position, accessToken),
        (error) => {
          console.error("Error getting location:", error);
          alert("Impossible d'accéder à votre position. Vérifiez vos paramètres.");
        },
        { enableHighAccuracy: true, timeout: 10000, maximumAge: 0 }
      );
    } else {
      console.log("Geolocation is not supported by this browser.");
      alert("Votre navigateur ne prend pas en charge la géolocalisation.");
    }
  }


  showPosition(position, accessToken) {
    const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${position.coords.longitude},${position.coords.latitude}.json?access_token=${accessToken}`;

    fetch(url)
      .then(response => response.json())
      .then((data) => {
        // Mise à jour de l'input avec la ville trouvée
        this.inputCityTarget.value = data.features[2].text + " " + data.features[3].text|| "";
      })
      .catch(error => console.error("Error fetching location:", error));
  }
}
