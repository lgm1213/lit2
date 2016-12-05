 $( function() {
    $( "#accordion" ).accordion();
  } );


function savePlaceRating() {
  var myRating={
    atmos: $("li#atmos-rating input")[0].value,
    drink: $("li#drink-rating input")[0].value,
    wait: $("li#wait-rating input")[0].value,
    cost: $("li#cost-rating input")[0].value,
    music: $("li#music-rating input")[0].value
  }
  var placeId = window.location.pathname.replace("/places/", "");
  console.log(placeId)
  $.ajax({
    type:"post",
    url: "/places/"+placeId+"/rate",
    data: myRating
  })
}



function initMap() {


// SET myPosition EQUAL TO PLACE LOCATION BY ID
console.log(gon.coordinateLatitude);
console.log(gon.coordinateLongitude);
          var myPosition = {
            lat: gon.coordinateLatitude,
            lng: gon.coordinateLongitude
          };

        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 14,
          center: myPosition,
          scrollwheel: false
        });

        var marker = new google.maps.Marker({
          position: myPosition,
          map: map,
          animation: google.maps.Animation.DROP
        });

      }
