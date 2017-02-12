var refreshRatings = function() {
  // Star ratings
    $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });  
    //   scoreName: 'comment[rating]',
    //   starHalf: '<%= image_path('star-half.png')%>',
    //   starOff: '<%= image_path('star-off.png')%>',
    //   starOn: '<%= image_path('star-on.png')%>'
    // });
    
    $('.rated').raty({ path: '/assets',
      // starHalf: '<%= image_path('star-half.png')%>',
      // starOff: '<%= image_path('star-off.png')%>',
      // starOn: '<%= image_path('star-on.png')%>',
      readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }
    });
};

$(document).on('turbolinks:load ajaxSuccess', function(){
  
  refreshRatings();

  // Zoom for images
  $('.img-zoom').elevateZoom({
    zoomType: "lens",
    lensShape: "round",
    lensSize: 250
  });
});
