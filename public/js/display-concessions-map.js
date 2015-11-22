// Namibia's coordinates as listed on http://www.openstreetmap.org/#map=6/-23.534/13.425
var map = L.map('concessions-map', {
  center: [-23.534, 16.172],
  zoom: 5,
  minZoom: 3,
  maxZoom: 9
});

$.get('/data', function(data) {
  if (data.type == "FeatureCollection") {
    var geojsonFeatures = data.features;
    createMapWithGeoJsonFeatures(geojsonFeatures);  
  }
});

function createMapWithGeoJsonFeatures(geojsonFeatures) {
  // Create Namibia country's background tiling for the map
  // Uses CartoDb's Basemaps in "Positron" colour scheme: https://cartodb.com/basemaps/
  L.tileLayer('http://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}@2x.png', {    
    attribution: 'Map tiles by <a href="http://cartodb.com/attributions#basemaps">CartoDB</a>, ' + 
        'under <a href="https://creativecommons.org/licenses/by/3.0/" target="_blank">CC BY 3.0</a>. ' + 
        'Data by <a href="http://www.openstreetmap.org/" target="_blank">OpenStreetMap</a>, under ODbL.'
  }).addTo(map);

  // Add PELs to the map
  geojsonFeatures.forEach(function(geoJsonFeature) {
    L.geoJson(geoJsonFeature, {
      onEachFeature: onEachFeature
    }).addTo(map);
  });
}

function onEachFeature(feature, layer) {
    if (feature.properties) {
      var concession_number = feature.properties.concession_number;
      var license_number = feature.properties.license_number;
      var company_name = feature.properties.company_name;
      var popupContent = 'Concession: ' + concession_number + 
          '<br/>License: ' + license_number + '<br/>Company: ' + company_name;        

      // Display a popup when the polygon is clicked
      layer.bindPopup(popupContent);

      // Label each polygon & display a popup when clicked as well
      var label = L.marker(layer.getBounds().getCenter(), {
        icon: L.divIcon({
          className: 'concessions-text-label',
          html: concession_number,
          iconSize: [100, 40]
        })
      })
      .bindPopup(popupContent)
      .addTo(map);
    }
}