<%@ include file='/jcore/doInitPage.jspf' %><%--
--%><%  
    request.setAttribute("jcms.mail.mail-subject",NotificationManager.getNotificationMailSubject(loggedMember));
    String linkHtmlAttributes = "style=\"color:#666;text-decoration:none;\"";
%><%@ include file='/jcore/alert/mail/doMailHeader.jspf' %><%--
--%><% try { %><% 
  
  Map<Workspace,Collection<? extends Publication>> pubMap = (Map)request.getSession().getAttribute(NotificationManager.CHANGES);
  int pubCount = Util.toInt(request.getSession().getAttribute(NotificationManager.PUBCOUNT),0);
  if (Util.isEmpty(pubMap)) {
    return;
  }
%><%--   
--%><body>
<style media="all" type="text/css">
td {
     font-family:<%= fontFamily %>;
     font-size:14px;
}
</style>
<%  
    String headerColor = "background-color:#5092BD";
%>
<table width="100%" cellpadding="10" cellspacing="0" border="0" id="backgroundTable" style="font-size:12px;background-color:#FFF;margin:0 auto;">
    <tr>
        <td class='vTop'>
				<% 
					ObjectIntTreeMap workspaceMap = new ObjectIntTreeMap();
					List<Workspace> workspaceKeys = new ArrayList<Workspace>(pubMap.keySet()); 
					String wsLinkStyle = " style=\"text-decoration:none;color:#666;\" ";
				%>
				<jalios:buffer name="workspaceBuffer"> 
				<jalios:foreach collection="<%= workspaceKeys %>" name="itWorkspace" type="Workspace"> 
				                 
				<% String workspaceHtmlAttr = wsLinkStyle + "name=\"workspace"+ itWorkspace.getId() +"\""; %>
				<tr>
				    <td style="text-decoration: none;font-size: 20px;color: #666;font-weight: bold;">
				        <% if (itCounter > 1) { %><div>&nbsp;</div><% } %>
				        <b><jalios:link htmlAttributes="<%= workspaceHtmlAttr %>" data="<%= itWorkspace %>"/></b>
				    </td>
				</tr>
				<tr>
				    <td class='vTop'>
				        <table width="100%" cellpadding="10">
				            <tr>
				                <td>
                        <table width="100%" style="background:#fff;border:1px solid #dbdbdb;color:#535353;" cellpadding="10">
                        <tr><td>
				                <div>
				                    <%-- EOF PUB LIST --%>
				                    <jalios:foreach collection="<%= pubMap.get(itWorkspace) %>" name="itPub" type="Publication" counter="itPubCounter">
				                        <% 
				                            workspaceMap.inc(itWorkspace,1);
				                            boolean displayThumbnail =  (itPub instanceof WebPage && Util.notEmpty(channel.getProperty("tag.thumbnail.thumbshot.url"))  || (itPub instanceof FileDocument && ((FileDocument)itPub).supportsThumbnail())); 
				                            boolean hasAbstract = Util.notEmpty(itPub.getAbstract(userLang));
				                        %>
				                        
				                        <div <%= itPubCounter != Util.getSize(pubMap.get(itWorkspace)) ?  " style=\"border-bottom:1px solid #EEE;\"" : "" %>>
				                            <% if (itPubCounter > 1) { %>
				                            <div>&nbsp;</div>
				                            <% } %>
				                            <b>
				                                <jalios:link data='<%= itPub %>' baseUrl='<%= channel.getUrl() %>'>
				                                     <%= itPub.getDataName(userLang) %>
				                                </jalios:link>
				                            </b>
				                            <table width="100%" cellpadding="">
				                            <tr><td class='vTop'>
				                            <table cellpadding="10">
	                                    <% if (displayThumbnail || hasAbstract) { %>
					                            <tr>
						                            <td>
						                            <div>
                                            <% if (displayThumbnail) { %>
                                            <a class="thumbnail" href="<%= itPub.getDisplayUrl(userLocale) %>" title="<%= encodeForHTMLAttribute(((Publication)itPub).getTitle(userLang), true) %>">
                                                <% String thumbnailHtmlAttributes = " align=\"left\" hspace=\"10\" style=\"border: 1px solid #CCC;padding:3px;\" "; %>
                                                <% if (itPub instanceof WebPage) { %>
                                                <jalios:thumbnail htmlAttributes="<%= thumbnailHtmlAttributes %>" addChannelBaseUrl="<%= true %>" url='<%= Util.getString(((WebPage)itPub).getUrlToShot(), ((WebPage)itPub).getUrl()) %>' width='120' height='90' css="thumbnail"><span>?</span></jalios:thumbnail>
                                                <% } else {%>
                                                <jalios:thumbnail htmlAttributes="<%= thumbnailHtmlAttributes %>" addChannelBaseUrl="<%= true %>" fileDoc='<%= (FileDocument) itPub %>' width='120' height='90' css="thumbnail"><span>?</span></jalios:thumbnail>
                                                <% } %>
                                            </a>
                                            <% } %>
                                            <%-- Abstract --%>
                                            <% if(hasAbstract) { %>
                                                <div class="abstract">
                                                    <% TypeFieldEntry fieldEntry = channel.getTypeAbstractFieldEntry(itPub.getClass()); %>
                                                    <% if (fieldEntry != null && fieldEntry.isFieldWiki()) { %>
                                                    <jalios:wiki baseUrl='<%= channel.getUrl() %>'><%-- 
                                                     --%><%= Util.truncate(itPub.getAbstract(userLang),400," (...)") %><%-- 
                                                     --%></jalios:wiki>
                                                    <% } else { %>
                                                    <%= itPub.getAbstract(userLang) %>
                                                    <% } %>
                                                </div>
                                            <% } %>
                                            </div>
						                            </td>
					                            </tr>
					                            <% } %>
				                              <tr>
                                        <td>
                                        <table width="100%">
                                            <tr>
                                        <% 
                                            Member author = itPub.getOpAuthor() != null ? itPub.getOpAuthor() : itPub.getAuthor();
                                        
                                            if (author != null) { %>
                                            <td width="<%= PhotoSize.ICON.getWidth() +10  %>">
                                            <jalios:link data="<%= author %>">
                                            <jalios:thumbnail  addChannelBaseUrl="<%= true %>" path='<%= Util.getString(author.getPhoto(), "images/jalios/layout/silhouette.jpg") %>'
                                                  width='<%= PhotoSize.ICON.getWidth() %>'
                                                  height='<%= PhotoSize.ICON.getHeight() %>'
                                                  htmlAttributes='style="padding:2px;border: 1px solid #CCCCCC;"'
                                                  alt='<%= author.getFullName() %>' css='photo'/></jalios:link>
                                        </td>
                                        <% } %>
                                        <td>
                                        <div class="meta" style="color:#535353;font-size:0.8em">
                                            <% 
                                                SimpleDateFormat sdf = new SimpleDateFormat(glp("notification.pub.day-format") + " '&middot;' " + glp("notification.pub.time-format")); 
                                                String pubDate = sdf.format(itPub.getMdate() != null ? itPub.getMdate() : itPub.getCdate());
                                              long difference = itPub.getMdate() != null ? itPub.getMdate().getTime() - itPub.getCdate().getTime() : itPub.getCdate().getTime() - itPub.getCdate().getTime();
                                              boolean isUpdate = !JcmsUtil.isSameId(itPub.getOpAuthor(),itPub.getAuthor()) || difference > 60000;
                                            %>
                                            <%= isUpdate ? glp("ui.fo.notification.meta-modify") : glp("ui.fo.notification.meta-create")  %>
                                            <jalios:link htmlAttributes="<%= linkHtmlAttributes %>" data="<%= author %>"/> &middot;
                                            <%= pubDate %>
                                        </div>
                                        <%-- Categories --%>
                                        <% 
                                            Category[] pubCategories = itPub.getCategories(loggedMember); 
                                        %>
                                        <jalios:if predicate='<%= Util.notEmpty(pubCategories) %>'>
                                            <div class="cat" style="color:#535353;font-size:0.8em">
                                                <strong><%= JcmsUtil.glp(userLang, "ui.com.lbl.categories") %> :</strong>
                                                <jalios:foreach array="<%= pubCategories %>" name="cat" type="Category" counter="itCatCounter">
                                                    <% if (itCatCounter.intValue() > 1) { %>, <% } %>
                                                    <jalios:link htmlAttributes="<%= linkHtmlAttributes %>" data='<%= cat %>' baseUrl='<%= channel.getUrl() %>'>
                                                        <%= cat.getName(userLang) %>
                                                    </jalios:link>
                                                </jalios:foreach>
                                            </div>
                                        </jalios:if>                                                
                                        </td>
                                    </tr>
                                </table>
                                        
                                        </td>				                              
				                              </tr> 
				                            </table>
				                            </td>
				                            </tr>
				                            </table>
				                        </div>
				                    </jalios:foreach>
				                    <%-- EOF PUB LIST --%>
				                </div>
	                    </td></tr>
                    </table>				            
                    </td>
				        </tr>
				        </table>
				    </td>
				</tr>
				</jalios:foreach>
				</jalios:buffer>
						<table width="600" class="content" cellpadding="0" style="line-height:150%;width:600px;max-width:600px;min-width:320px;font-family:<%= fontFamily %>;color:#535353;margin:0 auto;"  cellspacing="0" border="0" align="center">
							<tr>
		           <th style="<%= headerColor %>">
		                <table style="margin:0 10px;color:white;">
		                    <tr>
		                        <td>                
		                            <h3 class="title" style="color:white;margin:10 0; padding:0;"><%= glp("ui.fo.notification.subject-short", channel.getName()) %></h3>
		                        </th>
		                    </tr>
		                </table>
		            </th>								    
								    
							</tr>
							<tr>
							<td>
							<table style="background-color:#F8F8F8;line-height:150%;width:100%;font-family:<%= fontFamily %>;color:#535353;" cellpadding="5">
							<tr>
								<td>
								  <table cellpadding="10">
									  <tr>
										  <td>
										    <p><%= loggedMember.getFriendlyName() %>,</p>
										    <p>
										    <%= glp("ui.fo.notification.changes", pubCount ,channel.getName()) %>
										    </p>
										    <% if (Util.notEmpty(workspaceMap) && Util.getSize(workspaceMap) > 1) { %>
									        <ul>
									            <jalios:foreach collection="<%= workspaceKeys %>" type="Workspace" name="itWorkspace"> 
									            <li><a href='#workspace<%= itWorkspace.getId() %>' target="_self"><%= itWorkspace.getDataName(userLang) %> &middot; (<%= workspaceMap.getInt(itWorkspace,0) %>)</li>
									            </jalios:foreach>
									        </ul>
										    <% } %>
									    </td>
								    </tr>
							    </table>
						    </td>
							</tr>
							<%-- Display the buffered workspace & pub map --%><%= workspaceBuffer %>
							</table>
							</td>
								</tr>
								<tr><td>
	            <table style="line-height:150%;width:100%;font-family:<%= fontFamily %>;color:#535353;" cellpadding="5" cellspacing="0" border="0" align="center">
                <tr>
                <td style="border:1px solid #dbdbdb;background:#f0f0f0; font-size:14px;">
                    <div style="text-align:center;">
                        <%  
                            StringBuilder sb = new StringBuilder();
                            if (loggedMember != null) {
                               loggedMember.printDisplayLinkStart(sb, loggedMember.getLocale(), channel.getUrl(), null, null, null, null, null, null, null, false, null, null, null);
                               sb.append(glp("ui.mail.footer.lbl.profile"));
                               loggedMember.printDisplayLinkEnd(sb);
                            }
                        %>
                        <%= sb.toString() %> &middot; <a href="<%= channel.getUrl() %>"><%= glp("ui.mail.footer.lbl.home") %></a>
                    </div>
                </td>
            </tr>            
            
            <tr>
            <td style="background-color:white;font-size:11px;color:#999;width: 100%;text-align: center;">
                     <%= glp("ui.mail.footer.text",channel.getName()) %>
                </td>
            </tr>
                        
            </table>
							</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</body>
</html>
<%

} catch (Exception e) {
  Logger.getLogger("Notification email html").warn(e);
}
out.flush(); 
%>