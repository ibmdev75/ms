!function(d){var c=null;function e(f,i,g,h){d('<div id="tooltip'+h+'">'+g+"</div>").css({position:"absolute",display:"none",top:i+5,left:f+5,border:"1px solid #fdd",padding:"2px","background-color":"#ddd",opacity:0.8}).appendTo("body").fadeIn(200)}var a=["#9bd716","#66d1db","#e61717","#e6c217","#53c814","#1b4d97","#e66417","#ffec00","#8b8c00","#8c3310","#3e8c27","#167c8c","#fdff00","#71ff47","#ff5d1d","#28e2ff"];var b=function(){JcmsLogger.info("JCMS analytics","Init analytics JS ");d(".analytics-report").each(function(){var h=d(this);var g=h.attr("data-jalios-analytics-lazy-jsp");if(g){var f=h.closest(".tab-content").parent().find("FORM");params={agentId:h.attr("id"),active:h.hasClass("active")};d.extend(true,params,f.serializeObject());d(this).refresh({url:"admin/analytics/report/ajaxDisplayReport.jsp",params:params})}});JcmsLogger.info("JCMS analytics","analytics JS registered")};if(!d.jalios){d.jalios={}}d.jalios.analytics={defaultColors:a,default_options:{series:{pie:{show:false,radius:1,label:{show:true,radius:0.7,formatter:function(f,g){return'<div style="font-size:8pt;text-align:center;padding:2px;color:white;">'+Math.round(g.percent)+"% - "+g.data[0][1]+"</div>"},background:{opacity:0.8}},combine:{color:"#999",threshold:0.01}},lines:{show:false},points:{show:false},curvedLines:{active:false},bars:{show:true,barWidth:24*60*60*1000,fill:true,lineWidth:1,order:1}},yaxis:{ticks:10,min:0,tickDecimal:0},xaxis:{mode:"time",timeformat:"%0d/%0m",ticks:5},grid:{backgroundColor:{colors:["#fff","#eee"]},hoverable:true,clickable:true},colors:a,tooltipFormatter:null},addPlotHover:function(g,f){d("#chart"+g).bind("plothover",function(h,l,q,j){if(q){if(q.series.pie&&q.series.pie.show==true){d("#tooltip"+g).remove();c=null}else{if(c!=q.dataIndex){c=q.dataIndex;d("#tooltip"+g).remove();var o=q.datapoint[0].toFixed(2),m=d.isArray(q.datapoint[1])?(q.datapoint[1][0][1].toFixed(2)):(q.datapoint[1].toFixed(2));var k=new Date(parseInt(o));var n=q.series.label;if(!n){n=j.getData()[q.seriesIndex-1].label}var i=d.jalios.Properties.get("analytics.tooltipDefaultFormatter");if(!i){i=d.jalios.analytics.defaultTooltipValueFormatter}var p=((!f)?(i.apply(this,[m])):f(m,0));e(q.pageX,q.pageY,d.plot.formatDate(k,"%0d/%0m")+" , "+n+" : "+p,g)}}}else{d("#tooltip"+g).remove();c=null}})},defaultTooltipValueFormatter:function(h){var f=h-Math.round(h);if(f!=0){var g=Math.pow(10,2);return Math.round(h*g)/g}else{return Math.round(h)}},formatSize:function(i,f){switch(true){case (i>=1125899906842624):var g=i/1125899906842624,h="P";break;case (i>=1099511627776):var g=i/1099511627776,h="T";break;case (i>=1073741824):var g=i/1073741824,h="G";break;case (i>=1048576):var g=i/1048576,h="M";break;case (i>=1024):var g=i/1024,h="K";break;default:var g=i,h="";break}if(!(g)){g=0}return""+(g.toFixed(f))+h},addClickableLegend:function(f){return d.jalios.analytics.addLegend(f,true)},addLegend:function(j,h){var f=d.jalios.analytics.defaultColors;j=d.extend(true,{},{customColors:f},j);var k=j.customColors;var g=j.datasets;var m={series:{lines:{steps:false}},legend:{show:false}};m=d.extend(true,{},m,j.options);m=d.extend(true,{},d.jalios.analytics.default_options,m);var n=jQuery("#chart_legend"+j.suffix);var i='<table style="top:9px;right:9px;font-size:smaller;color:#545454"><tbody>';d.each(g,function(p,q){if(q.label==undefined){return}var o=(q.color!=null&&k[q.color]!=null)?k[q.color].toString():"#FFFFFF";i+='<tr class="tr-checked">';if(h){i+='<td class="legendRadio"><input type="checkbox" name="'+p+'" checked="checked" id="id'+p+"_"+j.suffix+'" data-jalios-action="toggle:tr-checked" data-jalios-target="TR" data-jalios-target-position="closest"><label for="id'+p+"_"+j.suffix+'"><img src="images/jalios/icons/check.gif"  class="checked-img" /><img src="images/jalios/icons/uncheck.gif" class="unchecked-img" /></label></td>'}i+='<td class="legendColorBox"><label for="id'+p+"_"+j.suffix+'"><div style="border:1px solid #ccc;padding:1px"><div style="width:4px;height:0;border:5px solid '+o+';overflow:hidden"></div></div></label></td>';i+='<td class="legendLabel"><label for="id'+p+"_"+j.suffix+'">'+q.label+"</label></td>";i+="</tr>"});n[0].innerHTML=i+"</tbody></table>";d.jalios.analytics.addPlotHover(j.suffix,m.tooltipFormatter);if(h){var l=function(p){var q=[];var o=p?d(p.currentTarget).closest("DIV.custom-legend"):n;o.find("input:checked").each(function(){var r=d(this).attr("name");if(r&&g[r]){r=parseInt(r);q.push(g[r])}});d.plot(jQuery("#chart"+j.suffix),q,m)};n.find("input").on("click",l);return l}else{var l=function(o){d.plot(jQuery("#chart"+j.suffix),g,m)};return l}},doSelectChange:function(f){$reportForm=d(f).closest("FORM");value=d(f).val();$reportForm.find("INPUT[name=predefinedPeriod]").val(value);if(value!=""){jQuery("<input>").attr({type:"hidden",name:"opSubmit",value:"opSubmit"}).appendTo($reportForm);$reportForm.submit()}else{jQuery(".date-criteria").removeClass("hide");jQuery("BUTTON[name=opSubmit]").removeClass("hide")}}};d(document).ready(function(f){b()})}(window.jQuery);