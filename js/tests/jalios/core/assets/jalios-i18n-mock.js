var I18N = {
  
  lang : "en",

  glp : function(prop) {
    var msg  = I18N[prop];
    if (!msg){ return prop; }
    
    for (var i = 1 ; i < arguments.length ; i++){
      msg = msg.replace('{'+(i-1)+'}',arguments[i]);
    }
    
    return msg;
  },
  
  'error.unknown':"An unknown error occured, please contact an administrator.",

  loaded : true,
  mock: true
};