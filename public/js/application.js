jQuery(function($) {
    // Asynchronously Load the map API 
    var script = document.createElement('script');
    script.src = "http://maps.googleapis.com/maps/api/js?sensor=false&callback=initialize";
    document.body.appendChild(script);
});

function initialize() {
    var map;
    var bounds = new google.maps.LatLngBounds();
    var mapOptions = {
        mapTypeId: 'roadmap'
    };
                    
    // Display a map on the page
    map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
    map.setTilt(45);
      
    // for(var i = 0; i < $('.each-nom h2').length; i++){
    
    // var name = $($('.each-nom h2')[]).text();
    // var latitude = $($('.lat')[i]).text()
    // var longitude = $($('.lon')[i]).text()

    //   var markers = [
    //       [name, latitude, longitude],
    //   ];
    // }     
    
    // Multiple Markers
    var markers = [
        ['Philz Coffee', 37.782397,-122.420507],
        ['The Metreon', 37.783783, -122.402962]

    ];
                        
    // Info Window Content
    // var infoWindowContent = [
    //     ['<div class="info_content">' +
    //     '<h3>Philz Coffee</h3>' +
    //     '<p>Laid-back local chain specializes in custom-blended coffees, plus teas, specialty drinks & pastries.</p>' +        '</div>'],
    //     ['<div class="info_content">' +
    //     '<h3>The Metreon</h3>' +
    //     '<p>The Metreon is a shopping center located in downtown San Francisco at the corner of 4th Street and Mission Street. It is a four-story 350,000 square foot building built over the corner of the underground Moscone Center convention center.</p>' +
    //     '</div>']
    // ];
        
    // Display multiple markers on a map
    var infoWindow = new google.maps.InfoWindow(), marker, i;
    
    // Loop through our array of markers & place each one on the map  
    for( i = 0; i < markers.length; i++ ) {
        var position = new google.maps.LatLng(markers[i][1], markers[i][2]);
        bounds.extend(position);
        marker = new google.maps.Marker({
            position: position,
            map: map,
            title: markers[i][0]
        });
        
        // Allow each marker to have an info window    
        google.maps.event.addListener(marker, 'click', (function(marker, i) {
            return function() {
                infoWindow.setContent(infoWindowContent[i][0]);
                infoWindow.open(map, marker);
            }
        })(marker, i));

        // Automatically center the map fitting all markers on the screen
        map.fitBounds(bounds);
    }

    // Override our map zoom level once our fitBounds function runs (Make sure it only runs once)
    var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event) {
        this.setZoom(14);
        google.maps.event.removeListener(boundsListener);
    });
    
}

// $(document).ready(function() {

//   var currentGps = [37.784670, -122.397586]

//  // function initialize() {
//    var mapCanvas = document.getElementById('map-canvas');
//    var mapOptions = {
//      center: new google.maps.LatLng(currentGps[0], currentGps[1]),
//      zoom: 8,
//      mapTypeId: google.maps.MapTypeId.ROADMAP
//    }

//    var map = new google.maps.Map(mapCanvas, mapOptions)

//   // var marker = new google.maps.Marker({
//   //     position: myLatlng,
//   //     map: map,
//   //     title: 'Hello World!'
//   // });

//   //   GMaps.geocode({
//   //   address: $('#address').val(),
//   //   callback: function(results, status) {
//   //     if (status == 'OK') {
//   //       var latlng = results[0].geometry.location;
//   //       map.setCenter(latlng.lat(), latlng.lng());
//   //       map.addMarker({
//   //         lat: latlng.lat(),
//   //         lng: latlng.lng()
//   //       });
//   //     }
//   //   }
//   // });
// });

