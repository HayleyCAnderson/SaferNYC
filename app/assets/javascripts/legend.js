function mainMarkersLegend() {
  var dates = $("#dates"),
  dataCount = "<h3>Total shown: " + markerDataSet.length + "</h3>",
  dateInformation = [];
  dateInformation.push("<h3>These collisions occurred:</h3><p>");
  dateInformation.push(dates.data("one-month-before"));
  dateInformation.push(" -</p><p>" + dates.data("most-recent"));
  return dateInformation.join("") + dataCount;
};

function mainHeatmapLegend() {
  var dates = $("#dates"),
  dataCount = "<h3>Total shown: " + heatmapDataSet.length + "</h3>",
  dateInformation = [];
  dateInformation.push("<h3>These collisions occurred:</h3><p>");
  dateInformation.push(dates.data("months-before"));
  dateInformation.push(" -</p><p>" + dates.data("most-recent"));
  return dateInformation.join("") + dataCount;
};

function markersLegend() {
  var labels = [],
  options = [
    "Pedestrian Injury",
    "Cyclist Injury",
    "Pedestrian/Cyclist Injury",
    "Pedestrian Fatality",
    "Cyclist Fatality",
    "Pedestrian/Cyclist Fatality"
  ],
  colors = {};
  colors["Pedestrian"] = "#AA2C3F";
  colors["Cyclist"] = "#293659";
  colors["Pedestrian/Cyclist"] = "#44004C";
  var victimType, casualtyType;

  $(options).each(function (index, content) {
    var label = [],
    optionTypes = content.split(" ");
    victimType = optionTypes[0];
    casualtyType = optionTypes[1];

    label.push("<li><span class='swatch' style='background:" + colors[victimType] + "'>");
    if (casualtyType=="Fatality") {
      label.push("<span class='symbol'></span>")
    };
    label.push("</span>" + content + "</li>");

    labels.push(label.join(""));
  });

  return "<h3>Map Key:</h3><ul>" + labels.join("") + "</ul>";
};
