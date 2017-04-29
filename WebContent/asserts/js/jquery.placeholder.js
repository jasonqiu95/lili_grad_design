(function($) {
	$.fn.placeholder = function(options) {
		var defaults = {
			labelMode: false,
			labelStyle: {},
			labelAlpha: false,
			labelAcross: false
		};
		var params = $.extend({}, defaults, options || {});
		
		//方法
		var funLabelAlpha = function(elementEditable, elementCreateLabel) {
			if (elementEditable.val() === "") {
				elementCreateLabel.css("opacity", 0.4).html(elementEditable.data("placeholder"));
			} else {
				elementCreateLabel.html("");	
			}
		};
		
		$(this).each(function() {
			var element = $(this), isPlaceholder = "placeholder" in document.createElement("input"), placeholder = element.attr("placeholder");

			if (!placeholder || (!params.labelMode && isPlaceholder) || (params.labelMode && !params.labelAcross && isPlaceholder)) { return; }

			element.data("placeholder", placeholder);
			
			if (params.labelMode) {			
				var idElement = element.attr("id"), elementLabel = null;
				if (!idElement) {
					idElement = "placeholder" + Math.random();	
					element.attr("id", idElement);
				}
				
				elementLabel = $('<label for="'+ idElement +'"></label>').css($.extend({
					lineHeight: "1.3",
					position: "absolute",
					color: "graytext",
					cursor: "text",
					margin: "2px 0 0 3px"
				}, params.labelStyle)).insertBefore(element);				
				
				if (params.labelAlpha) {
					element.bind({
						"focus": function() {
							funLabelAlpha($(this), elementLabel);
						},
						"input": function() {
							funLabelAlpha($(this), elementLabel);
						},
						"blur": function() {
							if (this.value === "") {
								elementLabel.css("opacity", 1).html(placeholder);  
							}	
						}
					});	
					
					if (!window.screenX) {
						element.bind("keyup", function() {
							funLabelAlpha($(this), elementLabel);	
						});
						element.get(0).onpaste = function() {
							setTimeout(function() {
								funLabelAlpha(element, elementLabel);	
							}, 30);	
						}
					}
					
					elementLabel.get(0).oncontextmenu = function() {
						element.trigger("focus");
						return false;	
					}
				} else {
					element.bind({
						"focus": function() {
							elementLabel.html("");
						},
						"blur": function() {
							if ($(this).val() === "") {
								elementLabel.html(placeholder);	
							}
						}
					});	
				}
				
				if (params.labelAcross) {
					element.removeAttr("placeholder");	
				}
				
				if (element.val() === "") {
					elementLabel.html(placeholder);	
				}
			} else {
				element.bind({
					"focus": function() {
						if ($(this).val() === placeholder) {
							$(this).val("");
						}
						$(this).css("color", "");	
					},
					"blur": function() {
						if ($(this).val() === "") {
							$(this).val(placeholder).css("color", "graytext");    
						}	
					}
				});	
				
				if (element.val() === "") {
					element.val(placeholder).css("color", "graytext");      
				}
			}	
		});
	};	
})(jQuery);