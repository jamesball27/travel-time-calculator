# Travel Time Calculator
This is a simple app that utilizes Citymapper's travel time API to calculate the travel time between destinations using public transport.

## Setup
Clone this repository and navigate to its root directory. From your command line, run `bundle exec rails s` to start a local Rails server. Then navigate to `localhost:3000/` in your browser to see the app in action.

This app depends on two third-party APIs: [Google Maps Places Autocomplete](https://developers.google.com/maps/documentation/javascript/) and [Citymapper](https://citymapper.3scale.net/). To run this app, you will need an API key for both of these services (available for free at the links provided). Once you have acquired your private keys, you will need to replace the following variables in the source code with your keys (as strings):

* In `app/views/layouts/application.html.erb` replace `ENV["google_api_key"]` with your Google Maps API key
* In `lib/citymapper_api.rb` replace `ENV["citymapper_api_key"]` with your Citymapper API key

Alternatively, you can use the [Figaro](https://github.com/laserlemon/figaro) gem to set up an `application.yml` file to set these ENV variables to your API keys.

## How to Use
Begin by selecting the date and time you wish to leave the Rentify offices in Barbican, London. Then click the "Add Destination" button to create a search bar from which you can select your first destination. You may add as many destinations as necessary. Once you have your destinations selected, click "Get travel times" to calculate your itinerary.

### Future directions
* Ability to factor in the length of stay at each location in the final itinerary
* Users can plot their destinations and view their itinerary on an interactive map
