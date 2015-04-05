<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
PortletRow box = (PortletRow) portlet;
ServletUtil.backupAttribute(pageContext, "ShowChildPortalElement");
ServletUtil.backupAttribute(pageContext, "RowToolbar");
%><%@ include file='/types/AbstractCollection/doIncludePortletCollection.jspf'%><%
ServletUtil.restoreAttribute(pageContext, "RowToolbar");
ServletUtil.restoreAttribute(pageContext, "ShowChildPortalElement");
boolean isPortletToolbar = isPortletMode && loggedMember.canWorkOn(box);
String dndTR = isPortletToolbar ? " id=\""+box.getId()+"\" class=\"dnd-container ID_"+box.getId()+"\"" : "";
int childrenCount = Util.getSize(box.getChildren());
%><table class="layout">
  <tr<%= dndTR %>><% 
    for (int i = 0 ; i < childrenCount ; i++){
      PortalElement child = box.getChildren()[i];
      
      if (child != null && Util.isEmpty(bufferList.get(i))){ // cf. OJ: Skip row if a portlet is not displayed
        continue;
      }
      
      String width    = Util.getString(box.getCellWidth(), i,"");
      String halign   = Util.getString(box.getAlignHorizontal()  , i,null);
      String valign   = Util.getString(box.getAlignVertical()    , i,"top");
      String bgImg    = Util.getString(box.getBackgroundImage()  , i,null);
      String bgColor  = Util.getString(box.getBackgroundColor()  , i,null);
      String bgRep    = Util.getString(box.getBackgroundRepeat() , i,"repeat");
      String childId  = child != null ? child.getId() : "";
      
      String css  = "";
      if (box.getRowSpacing() > 0 && i > 0){
        css += " padding-left: "+box.getRowSpacing()+"px;";
      }
      
      if (Util.notEmpty(width) && !"*".equals(width)) {
        css += " width: "+width+";";
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
      String dndTD = isPortletToolbar ? "ID_"+childId : "";
      %><td class="<%= (dndTD + " row-item v" + Util.recapitalize(valign) + (Util.notEmpty(halign) ? " text-" + halign : "")).trim() %>"<%= style %>><%
        %><%= bufferList.get(i) %><%
      %></td><% 
    }
  %></tr>
</table>