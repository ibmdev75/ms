(function(b){var a={series:{threshold:null}};function c(d){function e(n,w,o){if(!w.threshold){return}var f=o.pointsize,j,r,q,g,l,h=b.extend({},w);h.datapoints={points:[],pointsize:f};h.label=null;h.color=w.threshold.color;h.threshold=null;h.originSeries=w;h.data=[];var t=w.threshold.below,u=o.points,v=w.lines.show;threspoints=[];newpoints=[];for(j=0;j<u.length;j+=f){r=u[j];q=u[j+1];l=g;if(q<t){g=threspoints}else{g=newpoints}if(v&&l!=g&&r!=null&&j>0&&u[j-f]!=null){var k=(r-u[j-f])/(q-u[j-f+1])*(t-q)+r;l.push(k);l.push(t);for(m=2;m<f;++m){l.push(u[j+m])}g.push(null);g.push(null);for(m=2;m<f;++m){g.push(u[j+m])}g.push(k);g.push(t);for(m=2;m<f;++m){g.push(u[j+m])}}g.push(r);g.push(q)}o.points=newpoints;h.datapoints.points=threspoints;if(h.datapoints.points.length>0){n.getData().push(h)}}d.hooks.processDatapoints.push(e)}b.plot.plugins.push({init:c,options:a,name:"threshold",version:"1.0"})})(jQuery);