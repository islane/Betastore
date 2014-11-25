// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap
//= require 'jquery.tooltipster'
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
    $('.showtooltip').tooltipster({
    	theme: 'tooltipster-light',
        position: 'bottom'
      });
});

/*
$(function(){
	$('.example1').hover(function(){
		console.log("hover in");},
	function(){
		console.log("hover out");			
	}),
	$('.example1').mouseover(function(){
		$('.example1').animate({
		width: "70%",
		opacity: 0.4,
		marginLeft: "0.8in",
		fontSize: "3em",
		borderWidth: "10px"
		}, 1200 );
	}),
	$('.example1').mouseout(function(){
		$('.example1').animate({
		width: "10%",
		opacity: 1,
		marginLeft: "0in",
		fontSize: "1em",
		borderWidth: "0px"
		}, 800 );
	})	

	$('.hider').click(function(){
		$('.example1').fadeToggle( "slow", "linear" );
	})
});
*/

$(document).ready(function(){
	$('.vote-up').on('click', function(){
	$product = $(this).parent()
	$.post($product.data('vote-url')+"/vote_up", function(votes){
		$product.find('.votes').html(votes)
	  });		
	});
	
	$('.vote-down').on('click', function(){
	$product = $(this).parent()
	$.post($product.data('vote-url')+"/vote_down", function(votes){
		$product.find('.votes').html(votes)
	  });		
	});
	
});




