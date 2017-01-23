$(document).on('turbolinks:load', function(){
  $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]'});
  console.log("rating test");
  $('.rated').raty({ path: '/assets',
    readOnly: true,
    score: function() {
      return $(this).attr('data-score');
    }
  });
  console.log("rated test");
});