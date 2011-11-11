jQuery(function($) {
    $(".year").click(function() {
        jQuery("#album-" + $(this).attr('id')).slideToggle('slow');
    });
});