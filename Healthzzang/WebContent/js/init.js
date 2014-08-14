(function($){
	$(function(){
	  
	  var menu_head = $('ul.side-menu h2.title').height();
	  var item_height = $('ul.side-menu li a').height();
	  // Untoggle menu on click outside of it
    $(document).mouseup(function (e) {
      var container = $('ul.side-menu');
      if ((!container.is(e.target) && container.has(e.target).length === 0) && 
         (!($('a.menu-icon').is(e.target)) && $('a.menu-icon').has(e.target).length === 0)) {
        container.removeClass("in");
        $('mypage, ul.side-menu').removeClass("open");
      	$('ul.side-menu li').css("top", "100%");
	      $('ul.side-menu h2').css("top", "-60px");
      }
    });
    
    $("a.menu-icon").click(function(e) {
      e.preventDefault();
      if ($('ul.side-menu, mypage').hasClass('open')) {
      	$('ul.side-menu').removeClass('open');
      	$('mypage').removeClass('open');

      	// Reset menu on close
      	$('ul.side-menu li').css("top", "100%");
	      $('ul.side-menu h2').css("top", "-60px");
      }
      else {
	      $('ul.side-menu').addClass('open');
	      $('mypage').addClass('open');

	      $('ul.side-menu h2').css("top", 0);
	      $('ul.side-menu li').each(function() {
	      	// Traditional Effect
	      	if ($(this).hasClass('link')) {
	      		var i = ($(this).index() - 1)
		      	var fromTop = menu_head + (i * item_height);
		      	var delayTime = 100 * i;
		      	$(this).delay(delayTime).queue(function(){
			        $(this).css("top", fromTop);
			        $(this).dequeue();
			    	});
	      	}
	      	// Metro Effect

	      });
      }

    })
	
	}); // end of document ready
})(jQuery); // end of jQuery name space