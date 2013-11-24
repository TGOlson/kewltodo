$(function(){
	$('#todos').sortable()
	$('#lists').sortable()

	$('#create-new').on('ajax:success', function(e, data, status, xhr){
		$('#todos').append('<li class="single-todo unsaved">' + data + '</li>')
		checkForQuickDelete()
	})
})


function checkForQuickDelete(){
	$('.unsaved').on('click',function(){
		$(this).remove()
	})
}