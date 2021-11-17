import mapboxgl from "mapbox-gl";
import "mapbox-gl/dist/mapbox-gl.css";
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder";

const initMapbox = () => {
  const mapElement = document.getElementById("map");

  if (mapElement) {
    // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    const map = new mapboxgl.Map({
      container: "map",
      style: "mapbox://styles/trouni/ckw2tt56l8fw114uq6fg6jfe4",
    });

    const markers = JSON.parse(mapElement.dataset.markers);

    const fitMapToMarkers = (map, markers) => {
      const bounds = new mapboxgl.LngLatBounds();
      markers.forEach((marker) => bounds.extend([marker.lng, marker.lat]));
      map.fitBounds(bounds, { padding: 200, maxZoom: 15, duration: 2000 });
    };

    markers.forEach((marker) => {
      // Create info popup
      const popup = new mapboxgl.Popup().setHTML(marker.info_window);

      // Create HTML element for custom marker
      const element = document.createElement("div");
      element.innerHTML = marker.marker_html.trim();

      new mapboxgl.Marker(element)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(map);
    });

    fitMapToMarkers(map, markers);

    // Add search input field
    map.addControl(
      new MapboxGeocoder({
        accessToken: mapboxgl.accessToken,
        mapboxgl: mapboxgl,
      })
    );
  }
};

export { initMapbox };
