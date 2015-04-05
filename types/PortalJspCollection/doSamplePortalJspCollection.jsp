<%@ include file='/jcore/doInitPage.jspf' %><%@ include file='/jcore/portal/doPortletParams.jspf'  %><%-- 

  ------------------------------------------
   DISCLAIMER                                
   Sample JSP for PortalJspCollection with   
   basics use case:
   
   1. A PortletSelection bind to 'selection' id
   2. Portlets in a wrapping DIV 'sidebar'
   3. Other portlets 
  ------------------------------------------

--%><% 
  PortalJspCollection box = (PortalJspCollection) portlet;
  ServletUtil.backupAttribute(pageContext , "ShowChildPortalElement");
  
  // Add CSS headers
  // jcmsContext.addCSSHeader("...");
  
  // Filter children
  // request.setAttribute("children", new PortalElement[]{  });
  // request.setAttribute("evict",    new PortalElement[]{  });
%>
<%@ include file='/types/AbstractCollection/doIncludePortletCollection.jspf'%>
<%
  ServletUtil.restoreAttribute(pageContext , "ShowChildPortalElement");
  
  // Drag and Drop required a custom class wrapper 'dnd-container' and the wrapper ID. They also REQUIRED a DOM ID
  String dndCSS = (isLogged && loggedMember.canWorkOn(box)) ? "ID_"+box.getId()+" dnd-container" : "";
  
  
  // Retrieve Portlet's buffer for PortletSelection
  String selection = getPortlet(bufferMap,"selection");
%>
<div id="sample">
  
  <%-- Template using BootStrap grids --%>
  <div class="container">  
    <div class="row-fluid">
      <div class="col-md-8">
			  <% if (Util.isEmpty(selection) || isPortletMode){ %>
				  
				  <%-- Layout all portlets of the main column --%>
		          <div class="layout1"><%= getPortlet(bufferMap,"content1") %></div>
				  <div class="layout2"><%= getPortlet(bufferMap,"content2") %></div>
				<% } else { %>
				  
				  <%-- Display PortletSelection Instead (required a DOM id) --%>
				  <div id="selection" class="selection" ><%= selection  %></div>
				  
				<% } %>
				
				<div id="headlines" class="row-fluid headlines <%= dndCSS %>">
				  <% 
				    String[] headlines = getPortlets(bufferMap,"headlines");
				    List     portlets  = box.getChildrenList("headlines");
				  %>
				  <jalios:foreach array='<%= headlines %>' name="headline" type="String">
				    <div class='span<%= 12/headlines.length %>'><%= headline %></div>
				  </jalios:foreach>
				</div>
				
		  </div>
		  
			<%-- A Sample sidebar (required a DOM id) --%>
			<div id="sidebar" class="sidebar <%= dndCSS %> col-md-4">
			
			  <%-- Display all portlets with link name 'sidebar' --%>
			  <%= getPortlets(bufferMap,"sidebar","") %>
			  
			  <%-- Add button (required D&D) --%>
			  <%@ include file='/types/AbstractCollection/doAddPortletCollection.jspf' %>
			</div>
    </div>
    
    <%-- A Sample row (required a DOM id) --%>
    <div id="rowbar" class="row-fluid rowbar <%= dndCSS %>">
        
       <%-- Display all portlets with link name 'rowbar' --%>
       <% String[] rowbar = getPortlets(bufferMap, "rowbar"); %>
       <% if (Util.notEmpty(rowbar)){ %>
       <%   int span = (int) Math.floor(12/Util.getSize(rowbar)); %>
       <div class='span<%= span %>'><%= Util.join(rowbar, "</div><div class='span"+span+"'>")  %></div>
       <% } %>
       
    </div>
  </div>
</div>