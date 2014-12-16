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




