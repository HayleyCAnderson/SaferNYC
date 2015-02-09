source "https://rubygems.org"

ruby "2.1.3"
gem "rails", "4.1.6"

gem "coffee-rails", "~> 4.0.0"
gem "figaro"
gem "geocoder"
gem "google-webfonts"
gem "jbuilder", "~> 2.0"
gem "jquery-rails"
gem "lograge"
gem "mapbox-rails"
gem "newrelic_rpm"
gem "pg"
gem "sass-rails", "~> 4.0.3"
gem "soda-ruby", require: "soda"
gem "uglifier", ">= 1.3.0"

group :production do
  gem "rails_12factor"
  gem "unicorn"

  gem "rack-cache"
  gem "memcachier"
  gem "dalli"
  gem "kgio"
end

group :development do
  gem "derailed_benchmarks"
  gem "pry"
end
