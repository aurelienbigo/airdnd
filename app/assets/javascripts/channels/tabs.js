$(function(){

  $(".tab").on("click", function(e){
    var tab_id = $(this).attr('tabs');

    $('.tab').removeClass('active');
    $('.tab-content').addClass('hidden');

    $(this).addClass('active');
    $("#"+tab_id).removeClass('hidden');

    tab_id = $(this).data("target");
    $(tab_id).removeClass('hidden');

    // Change active tab

    // Hide all tab-content (use class="hidden")

    // Show target tab-content (use class="hidden")
  });

});
