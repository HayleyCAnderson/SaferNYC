README
==============

You can view SaferNYC at [safernyc.com](http://safernyc.com).

About SaferNYC
---------------------

SaferNYC visualizes recent car collisions in New York City
involving pedestrians and cyclists. It is an effort to
highlight the risks posed by cars and encourage increased
safety for pedestrians and cyclists.

Pedestrian and cyclist safety is a major concern in New
York City, and this application serves to highlight the
severity of the problem. The city is working on this
problem through the Vision Zero initiative, which includes
policy efforts and a few mapping applications. SaferNYC
complements the [Vision Zero View](http://www.nycvzv.info)
collision map that visualizes data slightly differently and
shows historical rather than recent data.

SaferNYC was created by [Hayley Anderson](http://hayleyanderson.us)
as her capstone project for the Fall 2014 Ruby on Rails program at
[Metis](http://www.thisismetis.com). It was created mainly using Ruby and JavaScript,
with help from the great technology provided by
[Mapbox](https://www.mapbox.com/about/maps/),
[OpenStreetMap](http://www.openstreetmap.org/about),
and [Leaflet](http://leafletjs.com).

About the Data
---------------------

The data used for SaferNYC is gathered from the
[NYPD Motor Vehicle Collisions](https://nycopendata.socrata.com/NYC-BigApps/NYPD-Motor-Vehicle-Collisions/h9gi-nx95?)
dataset on the [NYC Open Data](https://nycopendata.socrata.com)
website. It is gathered through the [Socrata Open Data API](http://dev.socrata.com)
and associated gem.

Approximately one third of collisions involving
pedestrians and cyclists already have latitude and
longitude included in the dataset, while the other two
thirds are geocoded through the
[Google Geocoding API](https://developers.google.com/maps/documentation/geocoding/?csw=1)
by way of the [Geocoder](http://www.rubygeocoder.com) gem.
A small number of incidents are missing cross streets or
zip codes, or otherwise cannot be geocoded. The
locations in the dataset typically show the nearest
intersection rather than exact location.

While cause and vehicle type are shown in the map when
available, it is unclear how these designations are
determined or how accurate they may be. Additional
contributing factors and vehicle types are not shown on
this map due to lack of data and the focus on collisions
involving pedestrians and cyclists.

The dataset on NYC Open Data is typically updated each
weekday afternoon and lags two to five days behind.
SaferNYC checks for new data each night and pulls it
into the application when available. SaferNYC does not
track historical data due to geocoding API limits.

*It is important to note that
this application relies on the presumed accuracy of data
reported on the NYC Open Data website. However, there
have been reports of incidents not simply being
documented inaccurately, but
[missing entirely](http://www.wnyc.org/story/nypdtrafficdeaths/).
This should be taken into account when viewing the data shown.*
