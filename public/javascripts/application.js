// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {
   $('#flash').delay().fadeIn('normal', function() {
      $(this).delay(2500).fadeOut();
   });
});


$(document).ready(function() {

   $('#per_page').change(function(){
     $.ajax({url: "<%= escape_javascript( @nav_id) %>",
       data: 'per_page=' + this.value,
       success: function(data){
         $('#component_grid').html(data);
         }
     })
   });
 });

