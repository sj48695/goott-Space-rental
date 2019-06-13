/* JS Document */

/******************************

[Table of Contents]

1. Vars and Inits
2. Set Header
3. Init Menu
4. Init Home SLider
5. Init SVG
6. Init Isotope
7. Init Clients Slider
8. Init Parallax


******************************/

$(document).ready(function()
{
	"use strict";

	/* 

	1. Vars and Inits

	*/

	var header = $('.header');

	setHeader();

	$(window).on('resize', function()
	{
		setHeader();

		setTimeout(function()
		{
			$(window).trigger('resize.px.parallax');
		}, 375);
	});

	$(document).on('scroll', function()
	{
		setHeader();
	});

	initMenu();
	initHomeSlider();
	initSvg();
	initIsotope();
	initClientsSlider();
	initParallax();

	/* 

	2. Set Header

	*/

	function setHeader()
	{
		if($(window).scrollTop() > 91)
		{
			header.addClass('scrolled');
		}
		else
		{
			header.removeClass('scrolled');
		}
	}

	/* 

	3. Init Menu

	*/

	function initMenu()
	{
		if($('.menu').length)
		{
			var header = $('.header');
			var hOverlay = $('.header_overlay');
			var menu = $('.menu');
			var hamb = $('.hamburger');
			var sup = $('.super_container_inner');
			var close = $('.menu_close');
			var overlay = $('.super_overlay');

			hamb.on('click', function()
			{
				header.toggleClass('active');
				sup.toggleClass('active');
				menu.toggleClass('active');
			});

			close.on('click', function()
			{
				header.toggleClass('active');
				sup.toggleClass('active');
				menu.toggleClass('active');
			});

			overlay.on('click', function()
			{
				header.toggleClass('active');
				sup.toggleClass('active');
				menu.toggleClass('active');
			});

			hOverlay.on('click', function()
			{
				header.toggleClass('active');
				sup.toggleClass('active');
				menu.toggleClass('active');
			});
		}
	}

	/* 

	4. Init Home SLider

	*/

	function initHomeSlider()
	{
		if($('.home_slider').length)
		{
			var homeSlider = $('.home_slider');
			homeSlider.owlCarousel(
			{
				items:1,
				animateOut: 'slideOutDown',
   				animateIn: 'fadeIn',
				loop:true,
				autoplay:true,
				nav:false,
				mouseDrag:false,
				smartSpeed:1200
			});

			/* Custom dots events */
			if($('.home_slider_custom_dot').length)
			{
				$('.home_slider_custom_dot').on('click', function()
				{
					$('.home_slider_custom_dot').removeClass('active');
					$(this).addClass('active');
					homeSlider.trigger('to.owl.carousel', [$(this).index(), 300]);
				});
			}

			/* Change active class for dots when slide changes by nav or touch */
			homeSlider.on('changed.owl.carousel', function(event)
			{
				$('.home_slider_custom_dot').removeClass('active');
				$('.home_slider_custom_dots li').eq(event.page.index).addClass('active');
			});

			/* Pause slider autoplay when search input field has focus
			   and resume autoplay when focus is lost */
			$('.search_input').on('focus', function()
			{
				homeSlider.trigger('stop.owl.autoplay');
			});

			$('.search_input').on('focusout', function()
			{
				homeSlider.trigger('play.owl.autoplay');
			});
		}
	}

	/* 

	5. Init SVG

	*/

	function initSvg()
	{
		if($('img.svg').length)
		{
			jQuery('img.svg').each(function()
			{
				var $img = jQuery(this);
				var imgID = $img.attr('id');
				var imgClass = $img.attr('class');
				var imgURL = $img.attr('src');

				jQuery.get(imgURL, function(data)
				{
					// Get the SVG tag, ignore the rest
					var $svg = jQuery(data).find('svg');

					// Add replaced image's ID to the new SVG
					if(typeof imgID !== 'undefined') {
					$svg = $svg.attr('id', imgID);
					}
					// Add replaced image's classes to the new SVG
					if(typeof imgClass !== 'undefined') {
					$svg = $svg.attr('class', imgClass+' replaced-svg');
					}

					// Remove any invalid XML tags as per http://validator.w3.org
					$svg = $svg.removeAttr('xmlns:a');

					// Replace image with new SVG
					$img.replaceWith($svg);
				}, 'xml');
			});
		}	
	}

	/* 

	6. Init Isotope

	*/

	function initIsotope()
	{
		if($('.grid').length)
		{
			$('.grid').isotope(
			{
				itemSelector:'.grid-item',
				layoutMode: 'fitRows'
			});
		}
	}

	/* 

	7. Init Clients Slider

	*/

	function initClientsSlider()
	{
		if($('.clients_slider').length)
		{
			var clientsSlider = $('.clients_slider');
			clientsSlider.owlCarousel(
			{
				items:5,
				autoplay:true,
				loop:true,
				dots:false,
				nav:false,
				smartSpeed:1200,
				margin:80,
				responsive:
				{
					0:
					{
						items:1,
						margin:0
					},
					576:
					{
						items:3,
						margin:50
					},
					768:
					{
						items:4,
						margin:50
					},
					992:
					{
						items:5,
						margin:80
					}
				}
			});
		}
	}

	/* 

	8. Init Parallax

	*/

	function initParallax()
	{
		if($('.parallax_background').length)
		{
			$('.parallax_background').parallax(
			{
				speed:0.8
			});
		}
	}

});