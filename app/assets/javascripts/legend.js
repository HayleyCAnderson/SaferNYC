function mainLegend(dataSet, startDate) {
  var dates = $("#dates"),
  dataCount = "<h3>Total shown: " + dataSet.length + "</h3>",
  dateInformation = [];
  dateInformation.push("<h3>These collisions occurred:</h3><p>");
  dateInformation.push(dates.data(startDate));
  dateInformation.push(" -</p><p>" + dates.data("most-recent"));
  return dateInformation.join("") + dataCount;
};

function modeLegend() {
  var labels = [],
  options = [
    "Pedestrian Injury",
    "Pedestrian Fatality",
    "Cyclist Injury",
    "Cyclist Fatality"
  ],
  colors = {};
  colors["Pedestrian"] = "#AA2C3F";
  colors["Cyclist"] = "#293659";
  colors["Pedestrian/Cyclist"] = "#5A004C";
  var victimType,
  casualtyType,
  hasPedestrianAndCyclistCasualty = false;

  $(modeDataSet).each(function(index, object) {
    if (object["properties"]["marker-color"] == "#5A004C") {
      hasPedestrianAndCyclistCasualty = true;
      return false;
    };
  });

  if (hasPedestrianAndCyclistCasualty == true) {
    options.push("Pedestrian/Cyclist Injury");
    options.push("Pedestrian/Cyclist Fatality");
  };

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

function causeLegend() {
  var labels = [],
  options = {};
  options["Environmental/Medical/Mechanical"] = "#291D40";
  options["Road Conditions"] = "#84CBC5";
  options["Unsafe Behavior"] = "#BBA5D3";
  options["Improper/Illegal Behavior"] = "#2F7F94";
  options["Unspecified/Unlisted"] = "#4B498C";
  options["Other"] = "#3232BA";

  $(Object.keys(options)).each(function (index, content) {
    var label = [];

    label.push("<li><span class='swatch' style='background:" + options[content] + "'>");
    label.push("</span>" + content + "</li>");

    labels.push(label.join(""));
  });

  return "<h3>Map Key:</h3><ul>" + labels.join("") + "</ul>";
};
