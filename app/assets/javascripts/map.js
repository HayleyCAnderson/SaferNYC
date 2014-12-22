$(function() {
  L.mapbox.accessToken = MAPBOX_ACCESS_TOKEN;
  var map = L.mapbox.map("map", MAPBOX_MAP_ID)
  .setView([40.7496821, -73.9704147], 13);

  var menu = document.getElementById("menu"),
  modeMarkers = L.mapbox.featureLayer(modeDataSet),
  causeMarkers = L.mapbox.featureLayer(causeDataSet),
  heatmap = L.mapbox.featureLayer(heatmapDataSet),
  heat = L.heatLayer([], {
    radius: 16,
    blur: 20,
    maxZoom: 16
  });

  function drawHeatMap() {
    heat.addTo(map);
    map.legendControl.addLegend(mainLegend(heatmapDataSet, "heatmap-start"));
  };

  function drawModeMarkers() {
    modeMarkers.addTo(map);
    map.legendControl.addLegend(mainLegend(modeDataSet, "marker-start"));
    map.legendControl.addLegend(modeLegend());
  }

  function drawCauseMarkers() {
    causeMarkers.addTo(map);
    map.legendControl.addLegend(mainLegend(causeDataSet, "marker-start"));
    map.legendControl.addLegend(causeLegend());
  }

  function buildHeatMap() {
    heatmap.eachLayer(function(l) {
      heat.addLatLng(l.getLatLng());
    });
  }

  function moveInfoControl() {
    $(".mapbox-control-info").insertBefore(".map-legends");
  };

  function removeLegends() {
    map.legendControl.removeLegend(mainLegend(heatmapDataSet, "heatmap-start"));
    map.legendControl.removeLegend(mainLegend(modeDataSet, "marker-start"));
    map.legendControl.removeLegend(modeLegend());
    map.legendControl.removeLegend(causeLegend());
  }

  function removeLayers() {
    map.removeLayer(modeMarkers);
    map.removeLayer(causeMarkers);
    map.removeLayer(heat);
  }

  drawModeMarkers();
  buildHeatMap();
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
