$(document).ready(function(){

	$('#projects').mouseenter(function(){
		$('.infobox').empty();
		$('.infobox').append('<h3>let me show you what i do.</h3>');
	});
	$('#about').mouseenter(function(){
		$('.infobox').empty();
		$('.infobox').append('<h3>let me show you what i do.</h3>');
	});
	$('#homepage').mouseenter(function(){
		$('.infobox').empty();
		$('.infobox').append('<h3>let me show you what i do.</h3>');
	});
	$('#blog').mouseenter(function(){
		$('.infobox').empty();
		$('.infobox').append('<h3>let me show you what i do.</h3>');
	});
	
	
	$('text').mouseenter(function(){
		$(this).fadeTo('slow', .6);
		
	});
	$('text').mouseleave(function(){
		$(this).fadeTo('slow', 0);
	});

/*	
	$('#lostpoints').mouseenter(function(){
		$(this).fadeTo('slow',0.5);
		$(this.p).fadeTo('slow',1);
$('#Eaton').fadeTo('slow', 1);
$('#WIE').fadeTo('slow', 1);
$('#CandP').fadeTo('slow', 1);
$('#spotlight').fadeTo('slow',1);
$('#engineering100').fadeTo('slow', 1);
$('#CUBE').fadeTo('slow', 1);
$('#illinitechhacks').fadeTo('slow', 1);
$('#LINC').fadeTo('slow', 1);
$('#EI').fadeTo('slow', 1);

		$('.infobox').empty();
		$('.infobox').append('<h3>Lost Points LLC</h3>');
		$('.infobox').append('<p>STEM focused interactive Kinect game for children.</p>');
		});
			
$('#Eaton').mouseenter(function(){
		$(this).fadeTo('slow',0.5);
		$('#lostpoints').fadeTo('slow', 1);
$('#WIE').fadeTo('slow', 1);
$('#CandP').fadeTo('slow', 1);
$('#spotlight').fadeTo('slow', 1);
$('#engineering100').fadeTo('slow', 1);
$('#CUBE').fadeTo('slow', 1);
$('#illinitechhacks').fadeTo('slow', 1);
$('#LINC').fadeTo('slow', 1);
$('#EI').fadeTo('slow', 1);

		$('.infobox').empty();
		$('.infobox').append('<h3>Eaton Corporation</h3>');
		$('.infobox').append('<p> Developed GUI and firmware to automate soft starter refurbishment </p>');
		});
	
	$('#CUBE').mouseenter(function(){
		$(this).fadeTo('slow',0.5);
$('#lostpoints').fadeTo('slow', 1);
$('#Eaton').fadeTo('slow', 1);
$('#WIE').fadeTo('slow', 1);
$('#CandP').fadeTo('slow', 1);
$('#spotlight').fadeTo('slow', 1);
$('#engineering100').fadeTo('slow', 1);
$('#illinitechhacks').fadeTo('slow', 1);
$('#LINC').fadeTo('slow', 1);
$('#EI').fadeTo('slow', 1);

		$('.infobox').empty();
		$('.infobox').append('<h3>CUBE Consulting</h3>');
		$('.infobox').append('<p></p>');
	});
	
	$('#LINC').mouseenter(function(){
		$(this).fadeTo('slow',0.5);
$('#lostpoints').fadeTo('slow', 1);
$('#Eaton').fadeTo('slow', 1);
$('#WIE').fadeTo('slow', 1);
$('#CandP').fadeTo('slow', 1);
$('#spotlight').fadeTo('slow', 1);
$('#engineering100').fadeTo('slow', 1);
$('#CUBE').fadeTo('slow', 1);
$('#illinitechhacks').fadeTo('slow', 1);
$('#EI').fadeTo('slow', 1);

		$('.infobox').empty();
		$('.infobox').append('<h3>Learning in Community</h3>');
		$('.infobox').append('<p>The Impact Lab</p>');
	});
	
	$('#WIE').mouseenter(function(){
		$(this).fadeTo('slow',0.5);
$('#lostpoints').fadeTo('slow', 1);
$('#Eaton').fadeTo('slow', 1);
$('#CandP').fadeTo('slow', 1);
$('#spotlight').fadeTo('slow', 1);
$('#engineering100').fadeTo('slow', 1);
$('#CUBE').fadeTo('slow', 1);
$('#illinitechhacks').fadeTo('slow', 1);
$('#LINC').fadeTo('slow', 1);
$('#EI').fadeTo('slow', 1);

		$('.infobox').empty();
		$('.infobox').append('<h3>Women in Engineering Advisory Board</h3>');
		$('.infobox').append('<p>WIE Welcome video, GAMES Camp Lab Assistant, Orange and Blue student panel</p>');
		});
	
	$('#engineering100').mouseenter(function(){
		$(this).fadeTo('slow',0.5);
$('#lostpoints').fadeTo('slow', 1);
$('#Eaton').fadeTo('slow', 1);
$('#WIE').fadeTo('slow', 1);
$('#CandP').fadeTo('slow', 1);
$('#spotlight').fadeTo('slow', 1);
$('#CUBE').fadeTo('slow', 1);
$('#illinitechhacks').fadeTo('slow', 1);
$('#LINC').fadeTo('slow', 1);
$('#EI').fadeTo('slow', 1);

		$('.infobox').empty();
		$('.infobox').append('<h3>Engineering 100</h3>');
		$('.infobox').append('<p>Taught classes, trained peers, developed lessons, collaborated with iEFX</p>');

	
	});
	
	$('#EI').mouseenter(function(){
		$(this).fadeTo('slow',0.5);
		$('#lostpoints').fadeTo('slow', 1);
$('#Eaton').fadeTo('slow', 1);
$('#WIE').fadeTo('slow', 1);
$('#CandP').fadeTo('slow', 1);
$('#spotlight').fadeTo('slow', 1);
$('#engineering100').fadeTo('slow', 1);
$('#CUBE').fadeTo('slow', 1);
$('#illinitechhacks').fadeTo('slow', 1);
$('#LINC').fadeTo('slow', 1);

		$('.infobox').empty();
		$('.infobox').append('<h3>Engineering Initiatives</h3>');
		$('.infobox').append('<p>Projects inspired and driven by students to improve the College of Engineering</p>');
	});
	$('#spotlight').mouseenter(function(){
		$(this).fadeTo('slow',0.5);
		$('#lostpoints').fadeTo('slow', 1);
$('#Eaton').fadeTo('slow', 1);
$('#WIE').fadeTo('slow', 1);
$('#CandP').fadeTo('slow', 1);
$('#engineering100').fadeTo('slow', 1);
$('#CUBE').fadeTo('slow', 1);
$('#illinitechhacks').fadeTo('slow', 1);
$('#LINC').fadeTo('slow', 1);
$('#EI').fadeTo('slow', 1);

		$('.infobox').empty();
		$('.infobox').append('<h3>Spotlight</h3>');
		$('.infobox').append('<p>A natural, effortless solution to video conferencing</p>');
	});


	$('#illinitechhacks').mouseenter(function(){
	$(this).fadeTo('slow',0.5);
		$('#lostpoints').fadeTo('slow', 1);
$('#Eaton').fadeTo('slow', 1);
$('#WIE').fadeTo('slow', 1);
$('#spotlight').fadeTo('slow', 1);
$('#engineering100').fadeTo('slow', 1);
$('#CUBE').fadeTo('slow', 1);
$('#CandP').fadeTo('slow', 1);
$('#LINC').fadeTo('slow', 1);
$('#EI').fadeTo('slow', 1);

		$('.infobox').empty();
		$('.infobox').append('<h3>HackIllinois</h3>');
		$('.infobox').append("<p> Host to UIUC's first hardware hackathon will be held April 11-13 </p>");	
	});
*/

});

