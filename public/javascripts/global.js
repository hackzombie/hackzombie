$(document).bind("mobileinit", function(){
  $.extend(  $.mobile , {
    pushStateEnabled: false,
    ajaxEnabled: false,
  });
});

$(function() {
    $('.vote-link').bind("ajax:success", function(evt, data, status, xhr){
        $(this).parent(".votescontainer").html(data); // insert content
    });
});
