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

