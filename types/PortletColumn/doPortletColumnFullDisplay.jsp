<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
PortletColumn box = (PortletColumn) portlet;
ServletUtil.backupAttribute(pageContext, "ShowChildPortalElement");
%><%@ include file='/types/AbstractCollection/doIncludePortletCollection.jspf'%><%
ServletUtil.restoreAttribute(pageContext, "ShowChildPortalElement");
boolean isPortletToolbar = isPortletMode && loggedMember.canWorkOn(box);
String dndDIV = isPortletToolbar ? " id=\""+box.getId()+"\" class=\"dnd-container ID_"+box.getId()+"\"" : "";
int childrenCount = Util.getSize(box.getChildren());
%>
<div<%= dndDIV %><% if (isPortletMode && childrenCount == 0) { %> style="padding-bottom: 50px;"<%} %>><% 
  for (int i = 0 ; i < childrenCount ; i++){
    PortalElement child = box.getChildren()[i];
    
    if (child != null && Util.isEmpty(bufferList.get(i))){ // cf. OJ: Skip row if a portlet is not displayed
      continue;
    }
    
    String halign   = Util.getString(box.getAlignHorizontal()  , i,null);
    String valign   = Util.getString(box.getAlignVertical()    , i,"top");
    String bgImg    = Util.getString(box.getBackgroundImage()  , i,null);
    String bgColor  = Util.getString(box.getBackgroundColor()  , i,null);
    String bgRep    = Util.getString(box.getBackgroundRepeat() , i,"repeat");
    String childId  = child != null ? child.getId() : "";
    
    String css = "";
    if (box.getColSpacing() > 0 && i < childrenCount-1){
      css += " margin-bottom: "+box.getColSpacing()+"px;";
    }
    
    if (Util.notEmpty(bgImg)) {
      css += " background-image: url("+bgImg+");";
      if (Util.notEmpty(bgRep)){
        css += " background-repeat: "+bgRep+";";
      }
    }
    
    if (Util.notEmpty(bgColor)){
      css += " background-color: "+bgColor+";";
    }
    
    String style = Util.notEmpty(css) ? " style=\""+css.trim()+"\"" : "";
    String dndDIVChild = isPortletToolbar ? "ID_"+childId : "";
    %><div class="<%= (dndDIVChild + " col-item v" + Util.recapitalize(valign) + (Util.notEmpty(halign) ? " text-" + halign : "")).trim() %>"<%= style %>><%
      %><%= bufferList.get(i) %><%
    %></div><% 
  } 
%></div>