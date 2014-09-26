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

  $('#follow_info').submit(function(event) {
    event.preventDefault();
   $('#follow_info input').val('Digesting...');
    $.ajax({
      url: $('.profile_info form').attr("action"),
      type: 'post'
      }).done(function(response){
        console.log(response);
        $('.profile_info form').replaceWith(response);
    });
  });
});
