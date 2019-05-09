// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require materialize-sprockets
//= require materialize-form
//= require_tree .

// @import "materialize";
// @import "https://fonts.googleapis.com/icon?family=Material+Icons";

// Sticky footer js
// Thanks to Charles Smith for this -- http://foundation.zurb.com/forum/posts/629-sticky-footer


(function($){
	$.fn.limitCB = function() {
		$('#skills').find(':checkbox').change(function(e) {
	   		if ($('input[type=checkbox]:checked').length > 6) {
	       		$(this).prop('checked', false)
	    	}
		})
	};

})(jQuery);


$(document).ready(function() {

	$().limitCB();
});

$(window).scroll(function() {
   if($(window).scrollTop() + $(window).height() > $(document).height() - 200) {
       $('#button').addClass('fixed_button');
   }else{
       $('#button').removeClass('fixed_button');
   }
});
