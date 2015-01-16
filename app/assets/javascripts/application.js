//= require jquery
//= require jquery_ujs
//= require_tree .
//= require mapbox.js

String.prototype.pluralize = function(count) {
  if (count === 1) {
    return this;
  } else {
    return this + "s";
  }
};

function calculateMonths(fromDate, toDate) {
  var fromDateObject = new Date(fromDate),
  toDateObject = new Date(toDate),
  timeDifference = toDateObject.getTime() - fromDateObject.getTime(),
  millisecondsPerMonth = 1000*60*60*24*30;

  return Math.round(timeDifference/millisecondsPerMonth);
}
