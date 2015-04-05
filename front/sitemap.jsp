<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/doHeader.jspf' %>
<% // Jalios Portal Information
	Category portalCategory  = (Category) request.getAttribute("portalCategory");
	DataSelector authorizedCategoriesSelector = Category.getAuthorizedSelector(loggedMember);
	TreeSet childrenSet = JcmsUtil.select(portalCategory.getChildrenSet(), 
																				authorizedCategoriesSelector, 
																				Category.getOrderComparator(userLang));
	int cols = (int)Math.round(Math.sqrt(childrenSet.size())) +1 ;
%>

<style>
.sitemap_title      { font: bold   14pt arial,helvetica,sans-serif;  }
.sitemap_level_one  { font: bold   12pt arial,helvetica,sans-serif;  }
.sitemap_level_two  { font: normal 10pt arial,helvetica,sans-serif;  }
</style>

<br />
<table align="center"    class='Sitemap'>
  <tr>
    <td class="sitemap_title text-center" colspan="<%= cols %>">
     <jalios:link data='<%= portalCategory %>'/>
    </td>
  </tr>
  <jalios:foreach collection='<%= childrenSet %>' type='Category' name='rootCat' counter='rootCatCounter'>
  <% if (rootCatCounter.intValue() % cols == 1 ) { %><tr><% }%>
	  <td class='vTop'>
		  <table class='layout'>
			  <tr>
			    <td nowrap="nowrap" class='sitemap_level_one text-left'><jalios:link data='<%= rootCat %>'/></td></tr>
			    <jalios:query name='subChildrenSet' 
			                  dataset='<%= rootCat.getChildrenSet() %>'
			                  selector='<%= authorizedCategoriesSelector %>' 
			                  comparator='<%= Category.getOrderComparator(userLang) %>' />
			    <jalios:foreach collection='<%= subChildrenSet %>' type='Category' name='childCat' counter='childCatCounter'>
				  <tr>
				    <td nowrap="nowrap" class='sitemap_level_two text-left'>
				    - <jalios:link data='<%= childCat %>'/>
				  </td>
				</tr>
			</jalios:foreach>
		</table>
	</td>
  <% if (rootCatCounter.intValue() % cols == 0 ) { %></tr><% }%>
</jalios:foreach>
</table>
<%@ include file='/jcore/doFooter.jspf' %>