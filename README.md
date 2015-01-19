README
==============

[![Code Climate](https://codeclimate.com/github/HayleyCAnderson/SaferNYC/badges/gpa.svg)](https://codeclimate.com/github/HayleyCAnderson/SaferNYC)

You can view SaferNYC at [safernyc.com](http://safernyc.com).

You can find more information about the code used to create
SaferNYC in the following blog posts:

* [Using the Socrata Open Data API and Gem to Make Complex Queries](http://blog.hayleyanderson.us/2014/12/24/using-the-socrata-open-data-api-and-gem-to-make-complex-queries/)
* [Parsing JSON and Passing Data Into a Table](http://blog.hayleyanderson.us/2014/12/30/parsing-json-and-passing-data-into-a-table/)

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
policy efforts and a few mapping applications.

SaferNYC complements the [Vision Zero View](http://www.nycvzv.info)
collision map that visualizes data slightly differently and
shows historical rather than recent data. Another notable map using
the same dataset is Andrew Hill's
[collisions by time of day](http://nyc.cartodb.com/viz/82ac527c-d63c-11e3-aa6d-0e73339ffa50).

The dataset used for this project does not include information on
charges or convictions in any of the accidents reported, but it should
be mentioned that very few of these accidents likely resulted in
consequences for the driver. Although the city has made changes in
recent months,
[current policy prevents convictions](http://www.citylab.com/politics/2014/10/the-outrageous-unjust-rule-that-lets-new-york-drivers-who-hit-pedestrians-off-the-hook/380980/)
even for drivers who broke the law and caused a pedestrian's or
cyclist's death.

SaferNYC was created by [Hayley Anderson](http://hayleyanderson.us)
as her capstone project for the Fall 2014 Ruby on Rails program at
[Metis](http://www.thisismetis.com). It was created mainly using
Ruby and JavaScript, with help from the great technology provided by
[Mapbox](https://www.mapbox.com/about/maps/),
[OpenStreetMap](http://www.openstreetmap.org/about),
and [Leaflet](http://leafletjs.com).

About the Data
---------------------

The data used for SaferNYC is gathered from the
[NYPD Motor Vehicle Collisions](https://nycopendata.socrata.com/NYC-BigApps/NYPD-Motor-Vehicle-Collisions/h9gi-nx95?)
dataset on the [NYC Open Data](https://nycopendata.socrata.com)
website. It is gathered through the
[Socrata Open Data API](http://dev.socrata.com) and associated gem.

Approximately one third of these collisions have latitude
and longitude included in the dataset, while the rest are
geocoded using the [Geocoder](http://www.rubygeocoder.com)
gem and [Google Geocoding API](https://developers.google.com/maps/documentation/geocoding/?csw=1).
A small number of incidents are missing
cross streets or zip codes, or otherwise cannot be geocoded.
The locations given represent the nearest intersection
rather than exact location.

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
reported on the NYC Open Data website. Incidents not reported
to the NYPD will obviously not be included. In addition, there
have been accounts of reported incidents not simply being
documented inaccurately, but
[missing entirely](http://www.wnyc.org/story/nypdtrafficdeaths/)
from this dataset.*

Using the Code
---------------------

If you really want to, you can run SaferNYC on your local machine.
SaferNYC is a simple Rails app using PostgreSQL, but there's API
and data set-up required.

To download SaferNYC:

```
$ git clone https://github.com/HayleyCAnderson/SaferNYC.git
$ cd SaferNYC
$ bundle
$ rake db:create db:migrate
```

Set up [Figaro](https://github.com/laserlemon/figaro) with:

```
google_key: Get one from https://code.google.com/apis/console
mapbox_access_token: Get one from https://www.mapbox.com
mapbox_map_id: hayley848.kcc07p1e
new_relic_key: Get one from http://newrelic.com
soda_application_token: Get one from http://dev.socrata.com
soda_dataset_identifier: h9gi-nx95
soda_domain: data.cityofnewyork.us
```

To download data:

`rake update_data`

The SODA API has a limit of 1000 incidents per call, and the
free version of the Google Geocoding API has a limit of 2500 geocodes
per day, so you will likely need to run this 2 or 3 times per day over
the course of a few days in order to fully populate your database.
Then you should be up and running.

Finally, if you notice something you'd like to fix, feel free to
submit a pull request to the development branch.
