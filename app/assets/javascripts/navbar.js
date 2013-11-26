var Navbar = {
	init: function(){
		$('#concentration-mode').on('click', this.toggleNavDisplay)
	},

	toggleNavDisplay: function(){
		$('nav').fadeToggle()
	}

}

$(function(){
	Navbar.init()
})