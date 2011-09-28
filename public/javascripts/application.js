// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

//Mouseover Popup Script
$(document).ready(function() {

	//Select all anchor tag with rel set to tooltip
	$('a[rel=tooltip]').mouseover(function(e) {
		
		//Grab the title attribute's value and assign it to a variable
		var tip = $(this).attr('title');	
		
		//Remove the title attribute's to avoid the native tooltip from the browser
		$(this).attr('title','');
		
		//Append the tooltip template and its value
		$(this).append('<div id="tooltip"><div class="tipHeader"></div><div class="tipBody">' + tip + '</div><div class="tipFooter"></div></div>');		
				
		//Show the tooltip with faceIn effect
		$('#tooltip').fadeIn('500');
		$('#tooltip').fadeTo('10',0.9);
		
	}).mousemove(function(e) {
	
		//Keep changing the X and Y axis for the tooltip, thus, the tooltip move along with the mouse
		$('#tooltip').css('top', e.pageY + 10 );
		$('#tooltip').css('left', e.pageX + 20 );
		
	}).mouseout(function() {
	
		//Put back the title attribute's value
		$(this).attr('title',$('.tipBody').html());
	
		//Remove the appended tooltip template
		$(this).children('div#tooltip').remove();
		
	});

});
function backButtonOverride()
{
  // Work around a Safari bug
  // that sometimes produces a blank page
  setTimeout("backButtonOverrideBody()", 1);

}

function backButtonOverrideBody()
{
  // Works if we backed up to get here
  try {
    history.forward();
  } catch (e) {
    // OK to ignore
  }
  // Every quarter-second, try again. The only
  // guaranteed method for Opera, Firefox,
  // and Safari, which don't always call
  // onLoad but *do* resume any timers when
  // returning to a page
  setTimeout("backButtonOverrideBody()", 500);
}
function showHide(shID) {
   if (document.getElementById(shID)) {
      if (document.getElementById(shID+'-show').style.display != 'none') {
         document.getElementById(shID+'-show').style.display = 'none';
         document.getElementById(shID).style.display = 'block';
      }
      else {
         document.getElementById(shID+'-show').style.display = 'inline';
         document.getElementById(shID).style.display = 'none';
      }
   }
}

//navigation script
sfHover = function() {
	var sfEls = document.getElementById("navbar").getElementsByTagName("li");
	for (var i=0; i<sfEls.length; i++) {
		sfEls[i].onmouseover=function() {
			this.className+=" hover";
		}
		sfEls[i].onmouseout=function() {
			this.className=this.className.replace(new RegExp(" hover\\b"), "");
		}
	}
}
if (window.attachEvent) window.attachEvent("onload", sfHover);

