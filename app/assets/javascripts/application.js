// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

document.addEventListener('DOMContentLoaded', () => {
  const start = document.getElementById('starting-location');
  new google.maps.places.Autocomplete(start);

  const appendNewAutocomplete = (e) => {
    e.preventDefault();

    const inputs = document.querySelectorAll('.autocomplete');
    const inputNumber = inputs.length;
    const form = document.getElementById('form');
    const submit = document.getElementById('submit');

    const label = document.createElement('label');
    const labelText = document.createTextNode(`Destination ${inputNumber}`);
    label.appendChild(labelText);
    const input = document.createElement('input');
    input.id = `input-${ inputs.length + 1}`;
    input.className = 'autocomplete';
    label.htmlFor = input.id;

    form.insertBefore(label, submit);
    form.insertBefore(input, submit);
    form.insertBefore(document.createElement('br'), submit);
    new google.maps.places.Autocomplete(input);
  };

  const addDestination = document.getElementById('add-destination');
  addDestination.addEventListener('click', appendNewAutocomplete);
});
