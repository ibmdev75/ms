<%@ include file='/jcore/doInitPage.jspf' %><% 
  jcmsContext.addJavaScript("js/jalios/core/jalios-admin-templates.js");
%>
<div class="tab-pane"><p><%= glp("ui.work.form.tpl.hlp") %></p>
<%
  com.jalios.jcms.handler.EditPublicationHandler formHandler  = (com.jalios.jcms.handler.EditPublicationHandler) request.getAttribute("formHandler");
  boolean                skinTemplate         = Util.toBoolean(request.getAttribute("skinTemplate"),false);
  WSTypeEntry            wste                 = skinTemplate ? formHandler.getWorkspace().getWSTypeEntry(AbstractPortletSkinable.class) 
                                                             : formHandler.getWorkspace().getWSTypeEntry(formHandler.getPublicationClass());
  Set<TypeTemplateEntry> singleTTe            = new HashSet<TypeTemplateEntry>();
  String                 inputName            = skinTemplate ? "skins" : "templates";
  
  Map<String, Set<TypeTemplateEntry>> usageMap = wste.getTemplateUsageMap();
  
  // Set "box" before "full"
  List<Map.Entry<String, Set<TypeTemplateEntry>>> entryList = new ArrayList<Map.Entry<String, Set<TypeTemplateEntry>>>(usageMap.entrySet());
  Map.Entry<String, Set<TypeTemplateEntry>> tmpEntry = null;
  for(Map.Entry<String, Set<TypeTemplateEntry>> itEntry : entryList){
    if (!itEntry.getKey().equals("box")){ continue; }
    tmpEntry = itEntry;
  }
  if (tmpEntry != null){
    entryList.remove(tmpEntry);
    entryList.add(0,tmpEntry);
  }
  
  for(Map.Entry<String, Set<TypeTemplateEntry>> itEntry : entryList) {
    
    String usage = itEntry.getKey();
    
    // No items
    if (Util.isEmpty(itEntry.getValue())){ continue; }
    
    // Retrieve value
    Set<TypeTemplateEntry> tteSet = new TreeSet<TypeTemplateEntry>(new TypeTemplateEntry.LabelComparator(userLang));
    tteSet.addAll(itEntry.getValue());
    for (Iterator<TypeTemplateEntry> it = tteSet.iterator() ; it.hasNext() ;){
      TypeTemplateEntry tte = it.next();
	    if (tte.isInternal()) { it.remove(); }
    }
    
    // No items after clean
    if (Util.isEmpty(tteSet)){ continue; }

    // Create tab
    /*
    if (!tabpane){
      tabpane = true;
      out.println("<span class='formInfo'>"+glp("ui.work.form.tpl.hlp")+"</span>");
      out.println("<div class='tab-pane' id='tmpl"+(skinTemplate ? "-skin":"")+"'>");
    }*/
    
    // Only one item
    if (tteSet.size() <= 1 && !formHandler.getDefaultTemplateUsage().equals(usage)){ 
      TypeTemplateEntry tte = tteSet.iterator().next();
      singleTTe.add(tte);
      //out.println("<input type='hidden' name='templates' value='"+tte.getName()+"' />");
      continue;
    }

    // Retrieve current template and input
    TypeTemplateEntry tteCurrent = formHandler.getAvailableTemplateEntry(usage);
    if (skinTemplate){
      tteCurrent = ((EditPortletSkinableHandler)formHandler).getAvailableSkinTemplateEntry(usage);
    }
    if(Util.notEmpty(tteSet) && !tteSet.contains(tteCurrent)){
      tteCurrent = (TypeTemplateEntry) tteSet.iterator().next();
    }
    
%>
<div class="tab-page">
  <h2 class="tab"><%= glp("ui.editportlet.usage."+(skinTemplate?"skin.":"")+usage) %></h2>
  
  <div class="row br template-wrapper">
    <div class="col-md-3 template text-right">
      <img src="<%= tteCurrent.getThumbnailPath() %>" class="template-image img-thumbnail" />
    </div>
    <div class="col-md-9">
      <% String tteDescription = "<strong>" + glp("ui.com.lbl.jsp") + "</strong> : <span class='ttPath'>" + tteCurrent.getPath() + "</span>"; %>
      <% request.setAttribute("field-inline", "true"); %>
	    <jalios:field  name='<%= inputName %>' value='<%= tteCurrent %>' description="<%= tteDescription %>" required="true">
         <select class="form-control template-chooser" name="<%= inputName %>" class="form-control">
           <jalios:foreach collection="<%= tteSet %>" name="tte" type="TypeTemplateEntry">
           <% String selected = tte == tteCurrent ? "selected='selected'" : ""; %>
           <option value="<%= tte.getName() %>" <%= selected %> data-jalios-path="<%= tte.getPath() %>"><%= itCounter.intValue() %>. <%= tte.getLabel(userLang) %></option>
           </jalios:foreach>
         </select>
	    </jalios:field> 
      <% request.removeAttribute("field-inline"); %>

      <%-- Description --%>
      <div class="well template-description">
	    <jalios:foreach collection="<%= tteSet %>" name="tte" type="TypeTemplateEntry">
	      <% String selected = tte.equals(tteCurrent) ? "" : "style='display:none;'"; %>
	      <div class="template-description-item <%= tte.getName() %>"  <%= selected %>><%= WikiRenderer.wiki2html(tte.getDescription(userLang), userLocale, null) %></div>
	    </jalios:foreach>
      </div>
      
    </div>
  </div>
</div>
<% } %>


<% if (Util.notEmpty(singleTTe)){ %>
<div class="tab-page">
  <h2 class="tab"><jalios:icon src='info' title="ui.editportlet.usage.misc-tmpl"/></h2>
  <div class='tmpl'>
    <strong><%= glp("ui.editportlet.usage.misc-tmpl") %></strong> :
    <ul>
    <jalios:foreach collection="<%= singleTTe %>" name="tte" type="TypeTemplateEntry">
      <li>
        <strong><%= glp("ui.editportlet.usage."+(skinTemplate?"skin.":"")+tte.getUsage()) %></strong>:
        <%= tte.getPath() %>
        <input type='hidden' name='<%= inputName %>' value='<%= tte.getName() %>' />
      </li>
    </jalios:foreach>
    </ul>
  </div>
</div>
<% } %>

</div>