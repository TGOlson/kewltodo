$(function(){
	$('#todos').sortable()
	$('#lists').sortable()

	$('#create-new').on('ajax:success', function(e, data, status, xhr){
		// uniqId helps preserve state if multiple new forms tabs are opened
		var uniqId = Math.floor(Math.random()*10000)
		$('#todos').append('<li class="single-todo unsaved" id="' + uniqId + '">' + data + '</li>')
		checkForQuickDelete()
		checkForSubmit(uniqId)
	})
})


function checkForQuickDelete(){
	$('.unsaved i').on('click',function(){
		$(this).closest('li').remove()
	})
}

function checkForSubmit(uniqId){
	$('#' + uniqId).on('ajax:success', function(e, data, status, xhr){
		$(this).replaceWith(data)
	})
}