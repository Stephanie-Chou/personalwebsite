$(document).ready(function()
{
	$('.bannerHeaderContent').hide();
	$('.bannerHeaderContent').animate({paddingTop:"+=200px"});
	$('.bannerHeaderContent').fadeTo('fast',1);
	$('.bannerHeaderContent').animate({paddingTop:"-=200px"}, 'slow');

	$('.bannerHeaderContentWelcome').hide();
	$('.bannerHeaderContentWelcome').animate({paddingTop:"+=200px"});
	$('.bannerHeaderContentWelcome').fadeTo('fast',1);
	$('.bannerHeaderContentWelcome').animate({paddingTop:"-=200px"}, 'slow');

	$('circle').mouseenter(function(){
        $(this).fadeTo('slow',0.5);
        });
	$('circle').mouseleave(function(){
		$(this).fadeTo('slow',1);
		$('navigation').empty();
		$('navigation').append('Navigate');
	});
	$('circle').click(function(){
		$(this).fadeTo('slow',1);
	});
	$('.blueOne').mouseenter(function(){
		$('navigation').empty();
        $('navigation').append("About Me");
    });	
	$('.blueTwo').mouseenter(function(){
		$('navigation').empty();
        $('navigation').append("Projects");
    });
    $('.blueThree').mouseenter(function(){
    	$('navigation').empty();
        $('navigation').append("Blog");
    });	
    $('.white').mouseenter(function(){
    	$('navigation').empty();
        $('navigation').append("Portfolio");
    });	
    
    
	// creates the slide animation for all list elements 
	
		$(".sliding-element").css({"margin-top": "10px", "font color": "#fff"});
		$(".sliding-element").animate({ marginLeft: "-25px" }, 500);
		$(".sliding-element").animate({ marginLeft: "35px" }, 500);
		$(".sliding-element").animate({ marginLeft: "15px" }, 500);



	$(".sliding-element").click(function() {
		if($(this).attr('id') != "nav-home")
		{
			page_click($(this).attr('id').replace('nav-',''));
		}
	});
	
	$(".btn-expand").click(function(){
		$('.'+$(this).attr('id')+'-item').slideToggle('slow');
		$(this).toggleClass("icon-chevron-up");
		$(this).toggleClass("icon-chevron-down");
	});
	
	
});
/*
function slide_intro()
{

		setTimeout(function (){
			page_click("welcome");}, 900);
			
		setTimeout(function (){
			$('#sliding-navigation').show();	
			slide('#sliding-navigation', 25, 5, 170, 1);}, 2000);
}*/