// Google Map
var map;
function initMap() {
  var myLatLng = {lat: 33.781923, lng: -84.380259};
  map = new google.maps.Map(document.getElementById('map'), {
    center: myLatLng,
    zoom: 16,
  });
  var marker = new google.maps.Marker({
    position: myLatLng,
    map: map,
    title: 'Hello from Atlanta!'
  });
}
