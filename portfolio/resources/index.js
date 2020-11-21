$( document ).ready(function(){
    //add smooth scrolling to navbar links and footer
    $('.navbar a, footer a[href="#myPage"]').on('click', function(event) {
      if ( this.hash !== '' ) {
        event.preventDefault();
        var hash = this.hash;
        //900 is number of milliseconds to complete animation
        $( 'html, body' ).animate( {
          scrollTop: $( hash ).offset().top
        }, 900, function() {
          //add the hash to the url after animation (default behavior that was stopped earlier)
          window.location.hash = hash;
        });
      }
    });
  })