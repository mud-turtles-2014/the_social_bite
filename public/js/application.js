$(document).ready(function() {
  // $('#bites').prepend("<h2>" + Hello World + "</h2>");
  $('#create_bite').submit(function(event) {
    event.preventDefault();
    $('#create_bite input').val('Creating...');
    $.ajax({
      url: $('#create_bite').attr("action"),
      type: 'post',
      data: $(this).serialize()
      }).done(function(response){
        $('#bites').prepend(response);
        $('textarea').val('');
      });
  });

  $('#unbite_me').click(function(event) {
    event.preventDefault();
    $.ajax({
      url: $('.profile_info form').attr("action"),
      type: 'post',
      dataType: 'json'
    }).done(function(response){
      // $('#unbite_me').val('Bite Me');
      $('.profile_info h4').empty();
      $('.profile_info').append('<h4>'+ "Followers: " +response.followers +"   |   Following: "+response.following + '</h4>');
      // $('.profile_info input').hide()
      // $('.profile_info input').append('input #bite_me');
      // $('.profile_info input').show();
      // console.log(response["followers"]);
      // $('#profile_info').append('<h4>'+Followers: | Following:'</h4>');
    });
  });

  $('#bite_me').click(function(event) {
    event.preventDefault();
    $.ajax({
      url: $('.profile_info form').attr("action"),
      type: 'post',
      dataType: 'json'
    }).done(function(response){
      // $('#bite_me').val('UNbite Me');
      $('.profile_info h4').empty();
      $('.profile_info').append('<h4>'+ "Followers: " +response.followers +"   |   Following: "+response.following + '</h4>');
    });
  });
});
