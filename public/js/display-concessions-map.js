// Namibia's coordinates as listed on http://www.openstreetmap.org/#map=6/-23.534/13.425
var map = L.map('concessions-map', {
  center: [-23.534, 16.172],
  zoom: 5,
  minZoom: 5,
  maxZoom: 8
});

var licenseLabels = {},
    licensePolygons = {};

$.get('/data', function(data) {
  if (data.type == "FeatureCollection") {
    var geojsonFeatures = data.features;
    createMapWithGeoJsonFeatures(geojsonFeatures);  
  }
});

$('button.license-number').click(function(event) {
  var clickedLicense = $( this ).attr('id');
  toggleMapElementForClickedLicense(clickedLicense, licenseLabels);
  toggleMapElementForClickedLicense(clickedLicense, licensePolygons);
});

function createMapWithGeoJsonFeatures(geojsonFeatures) {
  // Create Namibia country's background tiling for the map
  // Uses CartoDb's Basemaps in "Positron" colour scheme: https://cartodb.com/basemaps/
  var tileTemplate = 'http://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}@2x.png';
  var attributions = 'Map tiles by <a href="http://cartodb.com/attributions#basemaps">CartoDB</a>, ' + 
        'under <a href="https://creativecommons.org/licenses/by/3.0/" target="_blank">CC BY 3.0</a>. ' + 
        'Data by <a href="http://www.openstreetmap.org/" target="_blank">OpenStreetMap</a>, under ODbL.';
  
  L.tileLayer(tileTemplate, { 
    attribution: attributions
  }).addTo(map);

  // Add PELs to the map
  geojsonFeatures.forEach(function(feature) {
    var polygon = L.geoJson(feature, {
      onEachFeature: onEachFeature
    }).addTo(map);

    // Store PEL polygons for filtering later
    var license_number = feature.properties.license_number;
    if (licensePolygons.hasOwnProperty(license_number)) {
        licensePolygons[license_number].push(polygon);
      } else {
        licensePolygons[license_number] = [polygon];
      }
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

      // Store polygon labels for filtering later
      if (licenseLabels.hasOwnProperty(license_number)) {
        licenseLabels[license_number].push(label);
      } else {
        licenseLabels[license_number] = [label];
      }
    }
}

function toggleMapElementForClickedLicense(clickedLicense, licenseToMapElements) {
  for (var license in licenseToMapElements) {
    if (license !== clickedLicense) {
      // Hide PEL map elements for all other licenses except the one clicked
      var notClickedLicenseMapElements = licenseToMapElements[license];
      notClickedLicenseMapElements.forEach(function(element) {
        map.removeLayer(element);
      });
    } else {
      // Display the PEL map element for the clicked license
      var clickedLicenseMapElements = licenseToMapElements[clickedLicense];
      clickedLicenseMapElements.forEach(function(element) {
        // If it was hidden on a previous click, re-add it to the map
        if (!(map.hasLayer(element))) {
          map.addLayer(element)
        }
      });
    }
  }
}