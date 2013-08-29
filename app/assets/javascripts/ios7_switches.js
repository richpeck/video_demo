/** JQuery iOS7 Switch !! **/

(function( $ ){
	$.ios_switch = {}
	
	$.extend(true, $.ios_switch, {
	
		// change checkbox into switch
		init: function(elem) {
			if (!elem.is(':checkbox')) throw new Error('You can\'t make Switch out of non-checkbox input'); // make sure it's a checkbox
			
			elem.css("display", "none"); // hide the actual input
			
			var newdiv = document.createElement('div');
			elem.parent().prepend(newdiv);
			newdiv.className = 'ios-switch'; 
			newdiv.setAttribute("id", "ios_switch"); 
			newdiv.setAttribute("title", "Public?"); // add standard DIV
			
			$.ios_switch.prepare_dom(newdiv);
		},
	
		// add other dom elements for switch
		prepare_dom: function() {	
			var onBackground = document.createElement('div');
			onBackground.className = 'on-background background-fill';

			var stateBackground = document.createElement('div');
			stateBackground.className = 'state-background background-fill';

			var handle = document.createElement('div');
			handle.className = 'handle';

			document.getElementById("ios_switch").appendChild(onBackground);
			document.getElementById("ios_switch").appendChild(stateBackground);
			document.getElementById("ios_switch").appendChild(handle);	
		},
		
		// handle click request
		toggle: function() { 
			if($('#ios_switch').hasClass('on')){
				$.ios_switch.turnOff();
			} else {
				$.ios_switch.turnOn();
			}

			$.ios_switch.triggerChange();
		},
		
		// turn button on
		turnOn: function() {
			$('#ios_switch').addClass('on');
			$('#ios_switch').removeClass('off');
			$("#public").attr("checked",true);
		},
		
		//turn button off 
		turnOff: function() {
			$('#ios_switch').removeClass('on');
			$('#ios_switch').addClass('off');
			$("#public").attr("checked",false);
		},
		
		//trigger "change" event
		triggerChange: function() {
			$('#public').trigger('change');
		}
		
  });



   $.fn.ios_switch = function(elem) {
		var elem = elem;
		
		$.ios_switch.init(elem);
		
		return $('#ios_switch').each(function() {
			var $input = $(this)
		  
			$input
			.click(function() {		  
				$.ios_switch.toggle();
			})
		})

   }; 

})( jQuery );