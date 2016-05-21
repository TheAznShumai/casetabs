$(document).ready(function(){
  var twitter_user_path = '/twitter_users/';
  $('a.twitter-popup-ajax').popover({
    "template": '<div class="popover"><div class="popover-content"></div></div>',
    "trigger": "hover",
    "html": true,
    "content": function(){
      var div_id =  "tmp-id-" + $.now();
      var link = twitter_user_path + $(this).data('name');
      return details_in_popup(link, div_id);
    }
  });

  function details_in_popup(link, div_id){
    var template = $('#card__template').html();
    Mustache.parse(template);
    $.ajax({
      url: link,
      success: function(response){
        var rendered = Mustache.render(template, response);
        $('#'+div_id).html(rendered);
      }
    });
    return '<div id="'+ div_id +'"></div>';
  }
});
