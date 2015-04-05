!function ($) {
	// ------------------------------------------
	//  PRIVATE:
	// ------------------------------------------

    var previousPoint = null;  
	function showTooltip(x, y, contents, suffix) {
        $('<div id="tooltip'+suffix+'">' + contents + '</div>').css( {
            position: 'absolute',
            display: 'none',
            top: y + 5,
            left: x + 5,
            border: '1px solid #fdd',
            padding: '2px',
            'background-color': '#ddd',
            opacity: 0.80
        }).appendTo("body").fadeIn(200);
    };

    var defaultColorsVar = ["#9bd716","#66d1db","#e61717","#e6c217",
            "#53c814","#1b4d97","#e66417","#ffec00"
           ,"#8b8c00","#8c3310","#3e8c27","#167c8c"
           ,"#fdff00","#71ff47","#ff5d1d","#28e2ff"];
    
    /* Do stuff on DOM Ready */
    var register = function() {

      JcmsLogger.info('JCMS analytics', 'Init analytics JS ');
      //load lazy tab if any
      $(".analytics-report").each(function () {
        var $elt = $(this);
        var isLazy = $elt.attr("data-jalios-analytics-lazy-jsp");
        if(isLazy){         
          //do ajax loading of the content
          var $form = $elt.closest(".tab-content").parent().find("FORM");
          params = { "agentId" : $elt.attr("id"), "active":$elt.hasClass("active")}; 
          $.extend(true, params, $form.serializeObject());
          $(this).refresh({ 'url' : 'admin/analytics/report/ajaxDisplayReport.jsp' , "params" : params});
        } 
      });
      
      JcmsLogger.info('JCMS analytics', 'analytics JS registered');
    }
    
  // ------------------------------------------
	//  PUBLIC:
	// ------------------------------------------


	  // Namespace
	  if (!$.jalios)      { $.jalios    = {}; }	  
	  
	  $.jalios.analytics = {

	    defaultColors : defaultColorsVar,
			  
	    default_options : {
	       series: {	
	        	pie: { 
	        	  show: false,			
	        	  radius: 1,
	        	  label: {
        				show: true,
        				radius: 0.7,
        				formatter: function(label, series){
            				return '<div style="font-size:8pt;text-align:center;padding:2px;color:white;">'+Math.round(series.percent)+'% - '+series.data[0][1]+'</div>';
        				},
        				background: { opacity: 0.8 }
	        	  },
	        	  combine: {
	        	    color: '#999',
	        	    threshold: 0.01
	        	  }
	        	},
	          lines: { show: false },
	          points: { show: false },
	          curvedLines: {active: false },
	          bars: {
	            show: true,
	            barWidth: 24*60*60*1000,
	            fill: true,
	            lineWidth: 1,
	            order: 1
	         }
	        },
	        yaxis: {
	            ticks: 10,
	            min: 0,
	            tickDecimal : 0
	        },
	        xaxis: {
	          mode: "time",
	          timeformat: "%0d/%0m",
	          ticks:5
	        },
	        grid: {
	          backgroundColor: { colors: ["#fff", "#eee"] },
	       		hoverable: true, 
	       		clickable: true
	        }, 
	        colors : defaultColorsVar,
	        tooltipFormatter : null
	    },
	    
	  	addPlotHover: function(suffix, formatValue){
	    	$("#chart"+suffix).bind("plothover", function (event, pos, item, plot) {
		        if (item) {
		        	if(item.series.pie  && item.series.pie.show == true){
			            $("#tooltip"+suffix).remove();
			            previousPoint = null; 
		        	}
		        	else if (previousPoint != item.dataIndex) {
		                previousPoint = item.dataIndex;
		                
		                $("#tooltip"+suffix).remove();
		                var x = item.datapoint[0].toFixed(2),
		                    y = $.isArray(item.datapoint[1]) ? (item.datapoint[1][0][1].toFixed(2)) : (item.datapoint[1].toFixed(2));
		                
		                var theDate = new Date(parseInt(x)); 
		                var label = item.series.label;
		                if(!label){
		                	label = plot.getData()[item.seriesIndex-1].label;
		                }		                
		                var jsDefaultFormatter = $.jalios.Properties.get('analytics.tooltipDefaultFormatter');
		                if(!jsDefaultFormatter){
		                  jsDefaultFormatter = $.jalios.analytics.defaultTooltipValueFormatter;
		                }
		                var valueStr = ((!formatValue)?(jsDefaultFormatter.apply(this, [y])):formatValue(y, 0));
		                showTooltip(item.pageX, item.pageY,
		                            $.plot.formatDate(theDate, "%0d/%0m") +" , "+ label + " : "+ valueStr , suffix);
		            }
		        }
		        else {
		            $("#tooltip"+suffix).remove();
		            previousPoint = null;            
		        }
	    	});
		},
		
		defaultTooltipValueFormatter : function(value){
		  var decimalPart = value - Math.round(value);
		  if(decimalPart != 0){
		    var power = Math.pow(10, 2);
        return Math.round(value * power) / power;
		  }
		  else{
		    return Math.round(value);
		  }
    },
		
		formatSize: function(value, precision){
			switch(true) {
		        case (value >= 1125899906842624):
		            var label = value / 1125899906842624,
		                unit = "P";
		            break
		        case (value >= 1099511627776):
		            var label = value / 1099511627776,
		                unit = "T";
		            break
		        case (value >= 1073741824):
		            var label = value / 1073741824,
		                unit = "G";
		            break
		        case (value >= 1048576):
		            var label = value / 1048576,
		                unit = "M";
		            break
		        case (value >= 1024):
		            var label = value / 1024,
		                unit = "K";
		            break
		        default:
		            var label = value,
		                unit = "";
		            break
		    }
		
		    if (!(label)) { label = 0; }
		    return ""+(label.toFixed(precision)) + unit;
	  },
	  addClickableLegend : function( args){
		  return $.jalios.analytics.addLegend(args, true);
	  },
	  addLegend : function( args, isClickable){
	    // the color theme used for graphs
  		var defaultCustomColors = $.jalios.analytics.defaultColors;
  		args = $.extend(true, {}, {customColors : defaultCustomColors}, args);	
  		
  		var customColors = args.customColors;
  		var datasets = args.datasets;
			var options = {
		        series: {
	      			lines: { steps: false }
	      		},
	      		legend : {
	      			show : false
	      		}
		    };		    
			options = $.extend(true, {}, options, args.options);
			options = $.extend(true, {}, $.jalios.analytics.default_options, options);	
			
			// creation des legendes
			var legendContainer = jQuery("#chart_legend"+args.suffix);			
			// insert checkboxes 
			var legendContent = '<table style="top:9px;right:9px;font-size:smaller;color:#545454"><tbody>';    					
			$.each(datasets, function(key, val) {
				if(val.label == undefined){
					return;
				}
				var color = (val.color != null   && customColors[val.color] != null) ? customColors[val.color].toString() : "#FFFFFF";
				legendContent+= '<tr class="tr-checked">';
				if(isClickable){
					legendContent+= '<td class="legendRadio"><input type="checkbox" name="' + key +'" checked="checked" id="id' + key + '_'+args.suffix+'" data-jalios-action="toggle:tr-checked" data-jalios-target="TR" data-jalios-target-position="closest"><label for="id' + key + '_'+args.suffix+'"><img src="images/jalios/icons/check.gif"  class="checked-img" /><img src="images/jalios/icons/uncheck.gif" class="unchecked-img" /></label></td>';
				}
				legendContent+= '<td class="legendColorBox"><label for="id' + key + '_'+args.suffix+'"><div style="border:1px solid #ccc;padding:1px"><div style="width:4px;height:0;border:5px solid '+color+';overflow:hidden"></div></div></label></td>';
				legendContent+= '<td class="legendLabel"><label for="id' + key + '_'+args.suffix+'">'+ val.label + '</label></td>';
				legendContent+= '</tr>';
			});
			legendContainer[0].innerHTML = legendContent + '</tbody></table>';

			$.jalios.analytics.addPlotHover(args.suffix, options.tooltipFormatter);
			
			if(isClickable){
				var plotFunction =  function(event) {
					var data = [];
					var $e = event ? $(event.currentTarget).closest("DIV.custom-legend") : legendContainer;
					$e.find("input:checked").each(function () {
			            var key = $(this).attr("name");				            
			            if (key && datasets[key]){
			            	key = parseInt(key);
			                data.push(datasets[key]);
			            }
			        });
			        $.plot(jQuery("#chart"+args.suffix), data, options);
			    }
				
				//events			
				legendContainer.find("input").on('click', plotFunction);    					
				return plotFunction;
			}
			else{
				var plotFunction =  function(event) {
			        $.plot(jQuery("#chart"+args.suffix), datasets, options);
			    }
				return plotFunction;
			}
	  },
	  doSelectChange : function(element){
	    $reportForm = $(element).closest("FORM")
	    value = $(element).val();
		  $reportForm.find("INPUT[name=predefinedPeriod]").val(value);
		  if(value != ""){
		    jQuery('<input>').attr({"type": 'hidden',"name": 'opSubmit', "value":'opSubmit'}).appendTo($reportForm);
		    $reportForm.submit();
  	  }else{
  	    jQuery('.date-criteria').removeClass("hide");
        jQuery('BUTTON[name=opSubmit]').removeClass("hide");
  	  }
	  }
	};
  // ------------------------------------------
  // DOM READY CODE
  // ------------------------------------------

  $(document).ready(function($) {
    register();
  });

}(window.jQuery);