var Todo = {
	init: function(){
		$('#todos').sortable()
		$('#todos').on('click', '.unsaved i', this.removeItem)
		$('#todos').on('ajax:success', '.delete-action', this.removeItem)
		$('#create-new-todo').on('ajax:success', this.createForm)
		$('#todos').on('ajax:success', '.complete-action', this.updateItem)
		$('#todos').on('ajax:success', '.unsaved form', this.updateItem)	
	},

	createForm: function(e, data, status, xhr){
		$('#todos').append('<li class="single-todo unsaved">' + data + '</li>')
	},

	updateItem: function(e, data, status, xhr){
		Todo.findTarget(e).replaceWith(data)
	},

	removeItem: function(e, data, status, xhr){
		Todo.findTarget(e).fadeOut(350)
	},

	findTarget: function(e){
		return $(e.target).closest('li')
	}
}


$(function(){
	Todo.init()
})
