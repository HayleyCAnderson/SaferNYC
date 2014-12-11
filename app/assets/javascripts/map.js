$(function() {
  L.mapbox.accessToken = MAPBOX_ACCESS_TOKEN;
  var map = L.mapbox.map("map", MAPBOX_MAP_ID)
  .setView([40.7496821, -73.9704147], 13);

  var menu = document.getElementById("menu");

  var markers = L.mapbox.featureLayer(markerDataSet);

  var heatmap = L.mapbox.featureLayer(heatmapDataSet);
  var heat = L.heatLayer([], {
    radius: 16,
    blur: 20,
    maxZoom: 14
  });

  function drawHeatMap() {
    heat.addTo(map);
    heatmap.eachLayer(function(l) {
      heat.addLatLng(l.getLatLng());
    });
    map.legendControl.addLegend(mainHeatmapLegend());
  };

  function drawMarkers() {
    markers.addTo(map);
    map.legendControl.addLegend(mainMarkersLegend());
    map.legendControl.addLegend(markersLegend());
  }

  drawMarkers();

  addLayer(markers, "Data View", "active", function() {
    map.legendControl.removeLegend(mainHeatmapLegend());
    map.removeLayer(heat);
    drawMarkers();
  });

  addLayer(heatmap, "Heatmap", "", function() {
    map.legendControl.removeLegend(markersLegend());
    map.legendControl.removeLegend(mainMarkersLegend());
    map.removeLayer(markers);
    drawHeatMap();
  });

  function addLayer(layer, name, default_class, callback) {
    var link = document.createElement("a");
    link.href = "#";
    link.className = default_class;
    link.innerHTML = name;

    link.onclick = function(e) {
      e.preventDefault();

      $("#menu > a").removeClass();

      link.className = "active";

      callback();
    };

    menu.appendChild(link);
  };
});
