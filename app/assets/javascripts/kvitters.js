function htmlEncode(s) {
  return s.replace(/&(?!\w+([;\s]|$))/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
}
function downloadKvitters() {
  $.getJSON('/kvitters/last.json', function(data) {
    var items = [];

    $('#kvitter').empty();
    $('#kvitter').append('<h1 rel="popover" data-original-title="Kvitter" data-content="Kvitter is the internal Twitter of ISFiT. Write something inspiring, engaging, or simply informing, and share it with the world!">Kvitter</span>');
    $('#kvitter').append('<form name="kvitter" id="kvitter-form" action="kvitters/create.json" method="post"><textarea rows="2" name="message" placeholder="Si noe inspirerende..."></textarea><input type="submit" class="kvitter-btn small btn" value="Kvitt!" /></form>');
    $('#kvitter').append('<ul id="kvitter-posts"></ul>');
    $('[rel=popover]').popover({
      offset: 10
    });

    data.forEach(function(item){
      appendKvitter(item);
    });
    $('#kvitter-form').submit(function(e) {
      e.preventDefault();
      var spinner = new Spinner().spin(this);
      $('#kvitter-form > input').disabled = true;
      $.ajax({
          type: 'POST',
          url: "/kvitters/create.json",
          data: $('#kvitter-form').serialize(),
          dataType: 'json',
          success: function(data) {
                    prependKvitter(data);
                    spinner.stop();
                    $('#kvitter-form')[0].reset();
                    $('#kvitter-form > input').disabled = false;
                  }
      });
    })


  });
}

function appendKvitter(kvitt) {
  $('#kvitter-posts').append('<li id="kvitter-"' + kvitt.id + '"><a href="user/'+ kvitt.user_id + '">@' + kvitt.username + '</a> ' + htmlEncode(kvitt.message) + '<br><span class="small">'+ humanized_time_span(kvitt.created_at) + '</span></li>');
}

function prependKvitter(kvitt) {
  $('#kvitter-posts').prepend('<li id="kvitter-"' + kvitt.id + '"><a href="user/'+ kvitt.user_id + '">@' + kvitt.username + '</a> ' + htmlEncode(kvitt.message) + '<br><span class="small">'+ humanized_time_span(kvitt.created_at) + '</span></li>');
}

function spinKvitter() {
  var opts = {
    lines: 12, // The number of lines to draw
    length: 9, // The length of each line
    width: 5, // The line thickness
    radius: 10, // The radius of the inner circle
    color: '#000', // #rgb or #rrggbb
    speed: 1.1, // Rounds per second
    trail: 58, // Afterglow percentage
    shadow: false // Whether to render a shadow
  };
  var target = document.getElementById('kvitter');
  var spinner = new Spinner(opts).spin(target);
}

$(function() {
  downloadKvitters();
  setInterval(downloadKvitters,20*1000);
})
