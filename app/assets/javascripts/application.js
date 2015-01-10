//= require jquery
//= require jquery_ujs
//= require_tree .
//= require mapbox.js

String.prototype.pluralize = function(count) {
  if (count == 1) {
    return this;
  } else {
    return this + "s";
  };
};

function calculateMonths(fromDate, toDate) {
  var fromDate = new Date(fromDate),
  toDate = new Date(toDate),
  timeDifference = toDate.getTime() - fromDate.getTime(),
  millisecondsPerMonth = 1000*60*60*24*30;

  return Math.round(timeDifference/millisecondsPerMonth);
};
