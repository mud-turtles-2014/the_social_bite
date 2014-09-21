
$(document).ready(function() {

$('.replaceall').click(function(e) {
    e.preventDefault();
    var newStatus = status.replace(/#([^ ]+)/g, '<span class="hashtag">#$1</span>');
    $("#phrase").html(newStatus);
});
});

// var status='<%= bite.content %>';
<a href="javascript:void(0);" class="replaceall" ></a>"