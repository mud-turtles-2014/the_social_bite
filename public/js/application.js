$(document).ready(function() {
  $('.edit_bite_partial').hide()

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
        $('#create_bite input').val('Create Bite');
      });
  });

  $('#follow_btn').submit(function(event) {
    event.preventDefault();
    var button_value = $('#follow_btn input').val();
   $('#follow_btn input').val('Digesting...');
    $.ajax({
      url: $('.profile_info form').attr("action"),
      type: 'post'
      }).done(function(response){

        if (button_value === "Bite Me") {
          $('#follow_btn input').val("UNBite Me");
        } else {
          $('#follow_btn input').val("Bite Me");
        }
        $('#follow_info').html(response);
    });
  });

  $('#bites').on('click', '.edit_link', function(event) {
    event.preventDefault();
    console.log("hello");
    $('.edit_bite_partial').toggle()
  })

  // $('.edit_link').click(function(event) {
  //   debugger;
  //    event.preventDefault();
  //    console.log("bye");
  //    $('.edit_bite_partial').toggle();
  //    });

  $('#followers').click(function(event) {
    $('#followers').css('font-weight','bold')
    $('#following').css('font-weight','normal')
    $('.following').hide();
    $('.followers').show();
    });

  $('#following').click(function(event) {
    $('#following').css('font-weight','bold')
    $('#followers').css('font-weight','normal')
    $('.followers').hide();
    $('.following').show();
    });

});
