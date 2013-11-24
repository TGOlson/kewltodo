$(function(){
	$('#todos').sortable()
	$('#lists').sortable()

	checkForDelete()
	checkForComplete()

	$('#concentration-mode').on('click', function(){
		$('nav').toggleClass('hiddenNav', 500)
	})

	$('#create-new').on('ajax:success', function(e, data, status, xhr){
		// uniqId helps preserve state if multiple new forms tabs are opened
		var uniqId = Math.floor(Math.random()*10000)
		$('#todos').append('<li class="single-todo unsaved" id="' + uniqId + '">' + data + '</li>').fadeIn()
		checkForQuickDelete()
		checkForSubmit(uniqId)
	})


})


function checkForQuickDelete(){
	$('.unsaved i').on('click',function(){
		$(this).closest('li').fadeOut(350)
	})
}

function checkForSubmit(uniqId){
	$('#' + uniqId).on('ajax:success', function(e, data, status, xhr){
		$(this).replaceWith(data)
		checkForDelete() // need to reapply listeners when new item is created
	})
}

function checkForComplete(){
	$('.complete-action').on('ajax:success', function(e, data, status, xhr){
		var todo = $(this).closest('li')
		if(todo[0].className === 'single-todo complete'){
			$(todo).find('span.todo-description i').remove()
		} else {
			$(todo).find('span.todo-description').prepend("<i class='fa fa-check'></i>")
		}
		todo.toggleClass('complete')
		// checkForComplete()
	})
}

function checkForDelete(){
	$('.delete-action').on('ajax:success', function(){
		$(this).closest('li').fadeOut(350)
	})
}