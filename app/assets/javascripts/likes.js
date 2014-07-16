$(document).ready(function(){
  $('.like-btn').on('click', function(event){
	event.preventDefault();
	var url = $(this).attr('href');
	$.post(url);
	})

  var connection = new WebSocketRails('localhost:3000/websocket');
  channel = connection.subscribe('likes');
  channel.bind('new', function(post){
    var postElem = $('.like-btn[data-post-id=' + post.id + ']');
    postElem.text('♥ ' + post.new_like_count);
  })

})