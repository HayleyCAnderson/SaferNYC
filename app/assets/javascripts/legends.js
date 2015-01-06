function mainLegend(dataSet, startDate) {
  var description = [],
  dateInformation = [];

  var dates = $("#dates"),
  startDate = dates.data(startDate),
  mostRecentDate = dates.data("most-recent"),
  differenceInMonths = calculateMonths(startDate, mostRecentDate);

  description.push("<h2>Now showing ");
  description.push(differenceInMonths + " ");
  description.push("month".pluralize(differenceInMonths));
  description.push(" of motor vehicle collisions ");
  description.push("involving pedestrians and cyclists.</h2>");

  dateInformation.push("<h3>These collisions occurred:</h3><p>");
  dateInformation.push(startDate);
  dateInformation.push(" -</p><p>" + mostRecentDate);

  var dataCount = "<h3>Total shown: " + dataSet.length + "</h3>";

  return description.join("") + dateInformation.join("") + dataCount;
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

  options["Environmental/Medical/Mechanical"] = "#BFD13C";
  options["Road Conditions"] = "#F9C433";
  options["Unsafe Behavior"] = "#EAA1B9";
  options["Improper/Illegal Behavior"] = "#A32F43";
  options["Unspecified/Unlisted"] = "#333F3F";
  options["Other"] = "#5FCBCA";

  $(Object.keys(options)).each(function (index, content) {
    var label = [];

    label.push("<li><span class='swatch' style='background:" + options[content] + "'>");
    label.push("</span>" + content + "</li>");

    labels.push(label.join(""));
  });

  return "<h3>Map Key:</h3><ul>" + labels.join("") + "</ul>";
};
