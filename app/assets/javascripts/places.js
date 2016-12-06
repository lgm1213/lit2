 // $( function() {
 //    $( "#lit-rating" ).accordion();
 //  } );


 $( function() {
    var handle = $( "#custom-handle" );
    $( "#slider" ).slider({
      create: function() {
        handle.text( $( this ).slider( "value" ) );
      },
      slide: function( event, ui ) {
        handle.text( ui.value );
      }
    });
  } );

 $("#slider").slider(
{
            value:100,
            min: 0,
            max: 500,
            step: 50,
            slide: function( event, ui ) {
                $( "#slider-value" ).html( ui.value );
            }
}
);

$( "#slider-value" ).html(  $('#slider').slider('value') );
$('.ui-widget-content').css('background','linear-gradient(to right,  30%, orange 30%, orange 70%, green 70%, green 100%)');


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

          var myPosition = {
            lat: 25.8002131,
            lng: -80.2043848
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
