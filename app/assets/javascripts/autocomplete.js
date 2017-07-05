
const appendNewAutocomplete = (e) => {
  e.preventDefault();

  const inputs = document.querySelectorAll('.autocomplete');
  const inputNumber = inputs.length + 1;
  const form = document.getElementById('form');
  const buttons = document.querySelector('.buttons');

  const input = createNewInput(inputNumber);
  const label = createNewLabel(input, inputNumber);
  const hiddenInput = createNewHiddenInput(input, inputNumber);

  form.insertBefore(label, buttons);
  form.insertBefore(input, buttons);
  form.insertBefore(hiddenInput, buttons);
};

const createNewInput = inputNumber => {
  const input = document.createElement('input');
  input.id = `destination-${ inputNumber}`;
  input.className = 'autocomplete';
  input.name = `travel_times[destinations][${inputNumber - 1}][address]`;
  initializeAutocomplete(input);
  return input;
};

// need to add a hidden input to the form to send the coords to backend
// without changing the displayed address
const createNewHiddenInput = (input, inputNumber) => {
  const hiddenInput = document.createElement('input');
  hiddenInput.id = `coords-${input.id}`;
  hiddenInput.type = 'hidden';
  hiddenInput.name = `travel_times[destinations][${inputNumber - 1}][coords]`;
  return hiddenInput;
};

const createNewLabel = (input, inputNumber) => {
  const label = document.createElement('label');
  label.appendChild(document.createTextNode(`Destination ${inputNumber}`));
  label.htmlFor = input.id;
  return label;
};

const initializeAutocomplete = input => {
  const londonBounds = new google.maps.LatLngBounds(
    new google.maps.LatLng(51.384940, -0.351468),
    new google.maps.LatLng(51.672343, 0.148271)
  );

  const options = {
    bounds: londonBounds,
    types: ['address']
  };

  const autocomplete = new google.maps.places.Autocomplete(input, options);
  autocomplete.addListener('place_changed', updateCoords(autocomplete, input));
};

const updateCoords = (autocomplete, input) => {
  return () => {
    const hiddenInput = document.getElementById(`coords-${input.id}`);
    const location = autocomplete.getPlace().geometry.location;
    const lat = location.lat();
    const lng = location.lng();
    hiddenInput.value = lat + ',' + lng;
  };
};
