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
  const addDestination = document.getElementById('add-destination');
  addDestination.addEventListener('click', appendNewAutocomplete);
});

const appendNewAutocomplete = (e) => {
  e.preventDefault();

  const inputs = document.querySelectorAll('.autocomplete');
  const inputNumber = inputs.length + 1;
  const form = document.getElementById('form');
  const submit = document.getElementById('submit');

  const input = document.createElement('input');
  input.id = `destination-${ inputNumber}`;
  input.className = 'autocomplete';
  input.name = `destinations[${input.id}]`;
  initializeAutocomplete(input);

  const label = document.createElement('label');
  label.appendChild(document.createTextNode(`Destination ${inputNumber}`));
  label.htmlFor = input.id;

  form.insertBefore(label, submit);
  form.insertBefore(input, submit);
  form.insertBefore(document.createElement('br'), submit);
};

const initializeAutocomplete = input => {
  const autocomplete = new google.maps.places.Autocomplete(input);
  autocomplete.addListener('place_changed', updateValue(autocomplete, input));
};

const updateValue = (autocomplete, input) => {
  return () => {
    const location = autocomplete.getPlace().geometry.location;
    const lat = location.lat();
    const lng = location.lng();
    input.setAttribute('value', lat + ',' + lng);
  };
};
