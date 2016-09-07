function initMap() {
    var locationElement = document.getElementById('location_id')
    var input = document.getElementById('pac-input');
    var autocomplete = new google.maps.places.Autocomplete(input);

    var map = new google.maps.Map(document.getElementById('map'), {
        center: getCurrentLocation(locationElement),
        zoom: 4,
        zoomControl: true
    });

    setCurrentPlace(locationElement);
    map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

    autocomplete.bindTo('bounds', map);

    var infowindow = new google.maps.InfoWindow();
    var marker = new google.maps.Marker({
        map: map,
        anchorPoint: new google.maps.Point(0, -29)
    });

    autocomplete.addListener('place_changed', function() {
        infowindow.close();
        marker.setVisible(false);
        var place = autocomplete.getPlace();
        updatePlace(place);
    });

    function getCurrentLocation(locationElement) {
        if(navigator.geolocation && !locationElement.value) {
            navigator.geolocation.getCurrentPosition(function(position){
                map.setCenter({ lat: position.coords.latitude, lng: position.coords.longitude });
                map.setZoom(5);
            });
        }
        var unitedStates = {lat: 37.0902, lng: -95.7179};
        return unitedStates;
    }

    function setCurrentPlace(locationElement) {
        var currentPlaceId = "" + locationElement.value;
        if(currentPlaceId) {
            var service = new google.maps.places.PlacesService(map);
            service.getDetails({placeId: currentPlaceId}, function(place, status){
                if(place) {
                    input.value = place.formatted_address;
                    updatePlace(place);
                }
            });
        }
    }

    function updatePlace(place) {
      if (!place.geometry) {
          //TODO - do something better
          window.alert("Location not found!");
          return;
      }

      if (place.geometry.viewport) {
          map.fitBounds(place.geometry.viewport);
      } else {
          map.setCenter(place.geometry.location);
          map.setZoom(17);
      }
      marker.setIcon({
          url: place.icon,
          size: new google.maps.Size(71, 71),
          origin: new google.maps.Point(0, 0),
          anchor: new google.maps.Point(17, 34),
          scaledSize: new google.maps.Size(35, 35)
      });
      marker.setPosition(place.geometry.location);
      marker.setVisible(true);

      var address = friendlyAddress(place);

      infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
      infowindow.open(map, marker);

      updateFormElementWithNew(place);
    }

    function updateFormElementWithNew(place) {
      locationElement.value = place.place_id
    }

    function friendlyAddress(place) {
        var address = '';
        var components = place.address_components;
        if (components) {
            address = [
                (components[0] && components[0].short_name || ''),
                (components[1] && components[1].short_name || ''),
                (components[2] && components[2].short_name || '')
            ].join(' ');
        }
        return address;
    }
}
