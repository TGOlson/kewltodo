var Navbar = {
	init: function(){
		$('#concentration-mode').on('click', this.toggleNavDisplay)
		$('body').on('ajax:success', this.showStatus)
	},

	toggleNavDisplay: function(){
		$('nav').fadeToggle()
	},

	showStatus: function(e, data, status, xhr){
		if(data.message){
			var current = $('#current-location').find('.variable').text()
			$('#current-location').find('.variable').text(data.message).delay(1000).fadeOut(500, function(){
				$(this).text(current).fadeIn()
			})
		}
	}
}

$(function(){
	Navbar.init()
})