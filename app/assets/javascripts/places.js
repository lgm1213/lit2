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






function initMap() {


// SET myPosition EQUAL TO PLACE LOCATION BY ID
          var myPosition = {
            lat: gon.coordinateLatitude,
            lng: gon.coordinateLongitude
          };

        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 17,
          center: myPosition,
          scrollwheel: false
        });


  // Set the content for each marker
       var contentString =  '<h5 style="padding-bottom:0;margin-bottom:0;">' +
                                          gon.placeName +
                                          '</h5>' +
                                          gon.placeAddress +
                                          '<br/>' +
                                          gon.placeCity + ', ' +
                                          gon.placeState + ', ' +
                                          gon.placePostal +
                                          '<br/>' +
                                          gon.placePhone +
                                          '<br/>' // +
                                          // '<a href="#rate" class="btn btn-warning" />Is it Lit?</a>'
                                          ;

        var infowindow = new google.maps.InfoWindow();



        var marker = new google.maps.Marker({
          position: myPosition,
          map: map,
          animation: google.maps.Animation.DROP,
          content: infowindow.setContent(contentString)
        });



             marker.addListener('click', function() {
                 map.setZoom(14);
                 map.setCenter(marker.getPosition());
               });

             map.addListener('click', function() {
               infowindow.close();
             });


             marker.addListener('click', function() {
                 infowindow.open(map, this);
                 // $('canvas').on("click", function(){
                 //   console.log('marker clicked')
                 // });

             })


             infowindow.open(map, marker)

      }
