$(function() {
  L.mapbox.accessToken = MAPBOX_ACCESS_TOKEN;
  var map = L.mapbox.map("map", MAPBOX_MAP_ID, {
    center: [40.7496821, -73.9704147],
    zoom: 13,
    minZoom: 10,
    maxZoom: 16
  });

  var modeMarkers = L.mapbox.featureLayer([]),
  causeMarkers = L.mapbox.featureLayer([]),
  heatmap = L.mapbox.featureLayer([]),
  modeLegendString = null,
  causeLegendString = null,
  mainMarkerLegendString = null,
  mainHeatmapLegendString = null;

  var menu = document.getElementById("menu"),
  heat = L.heatLayer([], {
    radius: 16,
    blur: 20,
    maxZoom: 16
  }),
  heatmapInitialized = false;

  function drawHeatMap() {
    heat.addTo(map);
    if(mainHeatmapLegendString === null) {
      mainHeatmapLegendString = mainLegend(heatmapDataSet, "heatmap-start");
    }
    map.legendControl.addLegend(mainHeatmapLegendString);
  }

  function drawModeMarkers() {
    modeMarkers = L.mapbox.featureLayer(modeDataSet);
    modeMarkers.addTo(map);
    getMarkerLegend();
    if(modeLegendString === null) {
      modeLegendString = modeLegend();
    }
    map.legendControl.addLegend(modeLegendString);
  }

  function drawCauseMarkers() {
    causeMarkers = L.mapbox.featureLayer(causeDataSet);
    causeMarkers.addTo(map);
    getMarkerLegend();
    if(causeLegendString === null) {
      causeLegendString = causeLegend();
    }
    map.legendControl.addLegend(causeLegendString);
  }

  function buildHeatMap() {
    if(heatmapInitialized) return;
    heatmap = L.mapbox.featureLayer(heatmapDataSet);
    heatmap.eachLayer(function(l) {
      heat.addLatLng(l.getLatLng());
    });
    heatmapInitialized = true;
  }

  function getMarkerLegend() {
    if(mainMarkerLegendString === null) {
      mainMarkerLegendString = mainLegend(modeDataSet, "marker-start");
    }
    map.legendControl.addLegend(mainMarkerLegendString);
  }

  function moveInfoControl() {
    $(".mapbox-control-info").insertBefore(".map-legends");
  }

  function removeLegends() {
    map.legendControl.removeLegend(mainHeatmapLegendString);
    map.legendControl.removeLegend(mainMarkerLegendString);
    map.legendControl.removeLegend(modeLegendString);
    map.legendControl.removeLegend(causeLegendString);
  }

  function removeLayers() {
    map.removeLayer(modeMarkers);
    map.removeLayer(causeMarkers);
    map.removeLayer(heat);
  }

  drawModeMarkers();
  moveInfoControl();

  addLayer(modeMarkers, "Main View", "active", function() {
    removeLegends();
    removeLayers();
    drawModeMarkers();
  });

  addLayer(causeMarkers, "Causes", "", function() {
    removeLegends();
    removeLayers();
    drawCauseMarkers();
  });

  addLayer(heatmap, "Heatmap", "", function() {
    removeLegends();
    removeLayers();
    buildHeatMap();
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
  }
});
