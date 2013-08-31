/** JQuery iOS7 Switch !! **/

(function( $ ){
	$.ios_switch = {}
	
	$.extend(true, $.ios_switch, {
	
		//set the options
		options: {},
	
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
			
			//if profile is public, load checkbox pre-loaded
			if ( $.ios_switch.options.elem.is(":checked") ) {
				$($'#ios_switch').addClass('on');			
			}
			
		},
		
		// handle click request
		toggle: function(newDiv) { 
			if( newDiv.hasClass('on') ){
				$.ios_switch.turnOff(newDiv);
			} else {
				$.ios_switch.turnOn(newDiv);
			}

			$.ios_switch.triggerChange();
		},
		
		// turn button on
		turnOn: function(newDiv) {
			$(newDiv).addClass('on');
			$(newDiv).removeClass('off');
			$("#upload_public").prop('checked', true);
		},
		
		//turn button off 
		turnOff: function(newDiv) {
			$(newDiv).removeClass('on');
			$(newDiv).addClass('off');
			$("#upload_public").prop('checked', false);
		},
		
		//trigger "change" event
		triggerChange: function(elem) {
			$('#upload_public').trigger('change');
		}
		
  });

   $.fn.ios_switch = function(elem) {
		$.extend(true, $.ios_switch.options, {elem: elem})
		var elem = $.ios_switch.options.elem
		
		$.ios_switch.init(elem);
		$.extend(true, $.ios_switch.options, {newDiv: '#ios_switch'} )
		var newDiv = $($.ios_switch.options.newDiv)
		
		return newDiv.each(function() {
			var $input = $(this)
		  
			$input
			.click(function() {	
				$.ios_switch.toggle(newDiv);
			})
		})

   }; 

})( jQuery );