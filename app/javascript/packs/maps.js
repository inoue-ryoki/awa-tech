// let map;
// let geocoder;
// let marker;

// function initMap() {
//   geocoder = new google.maps.Geocoder();

//   map = new google.maps.Map(document.getElementById('map'), {
//     center: { lat: 40.7828, lng: -73.9653 },
//     zoom: 12,
//   });

//   marker = new google.maps.Marker({
//     position: { lat: 40.7828, lng: -73.9653 },
//     map: map
//   });
// }

// // Call initMap when the Google Maps API script is loaded
// function loadGoogleMapsScript() {
//   const script = document.createElement('script');
//   script.src = `https://maps.googleapis.com/maps/api/js?key=<%= ENV['GOOGLE_MAPS_API_KEY'] %>&libraries=places&callback=initMap`;
//   script.async = true;
//   document.head.appendChild(script);
// }

// // Call the function to load the Google Maps API script
// loadGoogleMapsScript();
