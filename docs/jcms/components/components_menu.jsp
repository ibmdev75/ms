<%@page import="com.jalios.jcms.taglib.menu.MenuInfo"%>
<%@page import="com.jalios.jcms.portlet.navigate.CategoryMenuInfo"%>
<%@page import="com.jalios.jcms.taglib.menu.MenuInfoFilter"%>
<%@page import="com.jalios.jcms.docs.ExampleExtractor"%>
<%@ include file="/docs/jcms/common/doInitSection.jspf" %>
<% Map<String, String> exampleMap = ExampleExtractor.parse(channel.getRealPath("/docs/jcms/components/components_menu.jsp")); %>
<div class="bs-docs-section">
  <h1 id="menu" class="page-header">Menu</h1>
  <p class="lead">How to write a menu with the new tag &lt;jalios:menu&gt; </p>
  
  <h3 id="menu-presentation">Menu presentation</h3>
  <p>Attributes to define for the <b>menu</b> tag:</p>
  <ul>
    <li><b>id</b> : <i>Optional</i>. Specifies an unique ID of the menu.</li>
    <li><b>name</b> : <i>Optional</i>. Specifies the name of the menu which can be used by the templates.</li>
    <li><b>css</b> : <i>Optional</i>. The css class to apply to wrapper.</li>
    <li><b>maxDepthLevel</b> : <i>Optional</i>. The max depth level to display. If not defined, allow to display all menu depth level.</li>
    <li><b>menuResource</b> : <i>Optional</i>. The resource name bind to the properties describing the menu JSPs.
      If the attribute is not set, it uses default JSPs defined by the following properties:
      <pre>jcms.resource.include.menu: jcore/menu/slide/doMenu.jsp
jcms.resource.include.submenu: jcore/menu/slide/doSubMenu.jsp
jcms.resource.include.menuitem: jcore/menu/slide/doMenuItem.jsp</pre>
      <p>Example:</p>
      <pre>&lt;jalios:menu ... menuResource="hover">...&lt;/jalios:menu>

Properties to define:

jcms.resource.include.hover-menu: jcore/menu/hover/doMenu.jsp
jcms.resource.include.hover-submenu: jcore/menu/hover/doSubMenu.jsp
jcms.resource.include.hover-menuitem: jcore/menu/hover/doMenuItem.jsp</pre>
    </li>
  </ul>
  <p>Attributes to define for the <b>submenu</b> tag:</p>
  <ul>
    <li><b>id</b> : <i>Optional</i>. Specifies an unique ID of the submenu.</li>
    <li><b>label</b> : <i>Optional</i>. Specifies the label of the submenu.</li>
    <li><b>icon</b> : <i>Optional</i>. Specifies the icon of the submenu.</li>
    <li><b>link</b> : <i>Optional</i>. Specifies the link of the submenu.</li>
    <li><b>depthLevel</b> : <i>Optional</i>. Specifies the depthLevel of the submenu. If not defined, computed from parent tag (menu tag / submenu tag).</li>
    <li><b>maxDepthLevel</b> : <i>Optional</i>. Specifies the max depth level. If not defined, computed from parent tag (menu tag / submenu tag).</li>
    <li><b>active</b> : <i>Optional</i>. Whether the current submenu is active.</li>
    <li><b>parentId</b> : <i>Optional</i>. The parent ID of the current submenu. If not defined, computed from parent tag (menu tag / submenu tag).</li>
    <li><b>css</b> : <i>Optional</i>. The css class to apply to wrapper.</li>
    <li><b>htmlAttributes</b> : <i>Optional</i>. The html attributes to use in the submenu.</li>
  </ul>
  <p>Attributes to define for the <b>menuitem</b> tag:</p>
  <ul>
    <li><b>id</b> : <i>Optional</i>. Specifies an unique ID of the menu item.</li>
    <li><b>label</b> : <i>Optional</i>. Specifies the label of the menu item.</li>
    <li><b>icon</b> : <i>Optional</i>. Specifies the icon of the menu item.</li>
    <li><b>link</b> : <i>Optional</i>. Specifies the link of the menu item.</li>
    <li><b>depthLevel</b> : <i>Optional</i>. Specifies the depthLevel of the menu item. If not defined, computed from parent tag (menu tag / submenu tag).</li>
    <li><b>maxDepthLevel</b> : <i>Optional</i>. Specifies the max depth level. If not defined, computed from parent tag (menu tag / submenu tag).</li>
    <li><b>active</b> : <i>Optional</i>. Whether the current menu item is active.</li>
    <li><b>parentId</b> : <i>Optional</i>. The parent ID of the current menu item. If not defined, computed from parent tag (menu tag / submenu tag).</li>
    <li><b>css</b> : <i>Optional</i>. The css class to apply to wrapper.</li>
    <li><b>htmlAttributes</b> : <i>Optional</i>. The html attributes to use in the menu item.</li>
  </ul>
  
  <h3 id="menu-static-example">Static menus</h3>
  <div class="bs-example">
    <h4>Menu with default JSP templates</h4>
    <div class="dropDownMenu">
      <div class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
          <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
              <li class="navbar-btn">
                <jalios:menu name="defaultMenu">
                  <jalios:menuitem label="Home" />
                  <jalios:submenu label="All categories">
                    <jalios:submenu label="Devices" icon="glyph: fa fa-laptop">
                      <jalios:submenu label="Mobile Phones" icon="glyph: fa fa-phone">
                        <jalios:menuitem label="Super Smart Phone" />
                        <jalios:menuitem label="Thin Magic Mobile" />
                        <jalios:menuitem label="Performance Crusher" />
                        <jalios:menuitem label="Futuristic Experience" />
                      </jalios:submenu>
                      <jalios:submenu label="Televisions" icon="glyph: fa fa-desktop">
                        <jalios:menuitem label="Flat Super Screen" />
                        <jalios:menuitem label="Gigantic LED" />
                        <jalios:menuitem label="Power Eater" />
                        <jalios:menuitem label="3D Experience" />
                        <jalios:menuitem label="Classic Comfort" />
                      </jalios:submenu>
                      <jalios:submenu label="Cameras" icon="glyph: fa fa-camera-retro">
                        <jalios:menuitem label="Smart Shot" />
                        <jalios:menuitem label="Power Shooter" />
                        <jalios:menuitem label="Easy Photo Maker" />
                        <jalios:menuitem label="Super Pixel" />
                      </jalios:submenu>
                    </jalios:submenu>
                    <jalios:submenu label="Magazines" icon="glyph: fa fa-book">
                      <jalios:menuitem label="National Geographics" />
                      <jalios:menuitem label="The Spectator" />
                      <jalios:menuitem label="Rambler" />
                      <jalios:menuitem label="Physics World" />
                      <jalios:menuitem label="The New Scientist" />
                    </jalios:submenu>
                    <jalios:submenu label="Store" icon="glyph: fa fa-shopping-cart">
                      <jalios:submenu label="Clothes" icon="glyph: fa fa-tags">
                        <jalios:submenu label="Women's Clothing" icon="glyph: fa fa-female">
                          <jalios:menuitem label="Tops" />
                          <jalios:menuitem label="Dresses" />
                          <jalios:menuitem label="Trousers" />
                          <jalios:menuitem label="Shoes" />
                          <jalios:menuitem label="Sale" />
                        </jalios:submenu>
                        <jalios:submenu label="Men's Clothing" icon="glyph: fa fa-male">
                          <jalios:menuitem label="Shirts" />
                          <jalios:menuitem label="Trousers" />
                          <jalios:menuitem label="Shoes" />
                          <jalios:menuitem label="Sale" />
                        </jalios:submenu>
                      </jalios:submenu>
                      <jalios:menuitem label="Jewelry" />
                      <jalios:menuitem label="Music" />
                      <jalios:menuitem label="Grocery" />
                    </jalios:submenu>
                    <jalios:menuitem label="Collections" />
                    <jalios:menuitem label="Credits" />
                  </jalios:submenu>
                  <jalios:submenu label="Other">
                    <jalios:menuitem label="Collections" />
                    <jalios:menuitem label="Credits" />
                  </jalios:submenu>
                </jalios:menu>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <hr />
    
    <h4>Slide Menu</h4>
    <jalios:menu name="defaultMenu">
      <jalios:menuitem label="Home" />
      <jalios:submenu label="All categories">
        <jalios:submenu label="Devices" icon="glyph: fa fa-laptop">
          <jalios:submenu label="Mobile Phones" icon="glyph: fa fa-phone">
            <jalios:menuitem label="Super Smart Phone" />
            <jalios:menuitem label="Thin Magic Mobile" />
            <jalios:menuitem label="Performance Crusher" />
            <jalios:menuitem label="Futuristic Experience" />
          </jalios:submenu>
          <jalios:submenu label="Televisions" icon="glyph: fa fa-desktop">
            <jalios:menuitem label="Flat Super Screen" />
            <jalios:menuitem label="Gigantic LED" />
            <jalios:menuitem label="Power Eater" />
            <jalios:menuitem label="3D Experience" />
            <jalios:menuitem label="Classic Comfort" />
          </jalios:submenu>
          <jalios:submenu label="Cameras" icon="glyph: fa fa-camera-retro">
            <jalios:menuitem label="Smart Shot" />
            <jalios:menuitem label="Power Shooter" />
            <jalios:menuitem label="Easy Photo Maker" />
            <jalios:menuitem label="Super Pixel" />
          </jalios:submenu>
        </jalios:submenu>
        <jalios:submenu label="Magazines" icon="glyph: fa fa-book">
          <jalios:menuitem label="National Geographics" />
          <jalios:menuitem label="The Spectator" />
          <jalios:menuitem label="Rambler" />
          <jalios:menuitem label="Physics World" />
          <jalios:menuitem label="The New Scientist" />
        </jalios:submenu>
        <jalios:submenu label="Store" icon="glyph: fa fa-shopping-cart">
          <jalios:submenu label="Clothes" icon="glyph: fa fa-tags">
            <jalios:submenu label="Women's Clothing" icon="glyph: fa fa-female">
              <jalios:menuitem label="Tops" />
              <jalios:menuitem label="Dresses" />
              <jalios:menuitem label="Trousers" />
              <jalios:menuitem label="Shoes" />
              <jalios:menuitem label="Sale" />
            </jalios:submenu>
            <jalios:submenu label="Men's Clothing" icon="glyph: fa fa-male">
              <jalios:menuitem label="Shirts" />
              <jalios:menuitem label="Trousers" />
              <jalios:menuitem label="Shoes" />
              <jalios:menuitem label="Sale" />
            </jalios:submenu>
          </jalios:submenu>
          <jalios:menuitem label="Jewelry" />
          <jalios:menuitem label="Music" />
          <jalios:menuitem label="Grocery" />
        </jalios:submenu>
        <jalios:menuitem label="Collections" />
        <jalios:menuitem label="Credits" />
      </jalios:submenu>
      <jalios:submenu label="Other">
        <jalios:menuitem label="Collections" />
        <jalios:menuitem label="Credits" />
      </jalios:submenu>
    </jalios:menu>
    
    <hr />

    <h4>Hover Menu</h4>
    <jalios:menu name="hoverMenu" menuResource="hover">
      <jalios:submenu label="All categories">
        <jalios:submenu label="Devices" icon="glyph: fa fa-laptop">
          <jalios:submenu label="Mobile Phones" icon="glyph: fa fa-phone">
            <jalios:menuitem label="Super Smart Phone" />
            <jalios:menuitem label="Thin Magic Mobile" />
            <jalios:menuitem label="Performance Crusher" />
            <jalios:menuitem label="Futuristic Experience" />
          </jalios:submenu>
          <jalios:submenu label="Televisions" icon="glyph: fa fa-desktop">
            <jalios:menuitem label="Flat Super Screen" />
            <jalios:menuitem label="Gigantic LED" />
            <jalios:menuitem label="Power Eater" />
            <jalios:menuitem label="3D Experience" />
            <jalios:menuitem label="Classic Comfort" />
          </jalios:submenu>
          <jalios:submenu label="Cameras" icon="glyph: fa fa-camera-retro">
            <jalios:menuitem label="Smart Shot" />
            <jalios:menuitem label="Power Shooter" />
            <jalios:menuitem label="Easy Photo Maker" />
            <jalios:menuitem label="Super Pixel" />
          </jalios:submenu>
        </jalios:submenu>
        <jalios:submenu label="Magazines" icon="glyph: fa fa-book">
          <jalios:menuitem label="National Geographics" />
          <jalios:menuitem label="The Spectator" />
          <jalios:menuitem label="Rambler" />
          <jalios:menuitem label="Physics World" />
          <jalios:menuitem label="The New Scientist" />
        </jalios:submenu>
        <jalios:submenu label="Store" icon="glyph: fa fa-shopping-cart">
          <jalios:submenu label="Clothes" icon="glyph: fa fa-tags">
            <jalios:submenu label="Women's Clothing" icon="glyph: fa fa-female">
              <jalios:menuitem label="Tops" />
              <jalios:menuitem label="Dresses" />
              <jalios:menuitem label="Trousers" />
              <jalios:menuitem label="Shoes" />
              <jalios:menuitem label="Sale" />
            </jalios:submenu>
            <jalios:submenu label="Men's Clothing" icon="glyph: fa fa-male">
              <jalios:menuitem label="Shirts" />
              <jalios:menuitem label="Trousers" />
              <jalios:menuitem label="Shoes" />
              <jalios:menuitem label="Sale" />
            </jalios:submenu>
          </jalios:submenu>
          <jalios:menuitem label="Jewelry" />
          <jalios:menuitem label="Music" />
          <jalios:menuitem label="Grocery" />
        </jalios:submenu>
        <jalios:menuitem label="Collections" />
        <jalios:menuitem label="Credits" />
      </jalios:submenu>
      <jalios:submenu label="Other">
        <jalios:menuitem label="Collections" />
        <jalios:menuitem label="Credits" />
      </jalios:submenu>
    </jalios:menu>
    
    <hr />

    <h4>Vertical Menu</h4>
    <div style="max-width: 500px">
      <jalios:menu name="verticalMenu" menuResource="vertical">
        <jalios:menuitem label="Home" />
        <jalios:submenu label="All categories">
          <jalios:submenu label="Devices" icon="glyph: fa fa-laptop">
            <jalios:submenu label="Mobile Phones" icon="glyph: fa fa-phone">
              <jalios:menuitem label="Super Smart Phone" />
              <jalios:menuitem label="Thin Magic Mobile" />
              <jalios:menuitem label="Performance Crusher" />
              <jalios:menuitem label="Futuristic Experience" />
            </jalios:submenu>
            <jalios:submenu label="Televisions" icon="glyph: fa fa-desktop">
              <jalios:menuitem label="Flat Super Screen" />
              <jalios:menuitem label="Gigantic LED" />
              <jalios:menuitem label="Power Eater" />
              <jalios:menuitem label="3D Experience" />
              <jalios:menuitem label="Classic Comfort" />
            </jalios:submenu>
            <jalios:submenu label="Cameras" icon="glyph: fa fa-camera-retro">
              <jalios:menuitem label="Smart Shot" />
              <jalios:menuitem label="Power Shooter" />
              <jalios:menuitem label="Easy Photo Maker" />
              <jalios:menuitem label="Super Pixel" />
            </jalios:submenu>
          </jalios:submenu>
          <jalios:submenu label="Magazines" icon="glyph: fa fa-book">
            <jalios:menuitem label="National Geographics" />
            <jalios:menuitem label="The Spectator" />
            <jalios:menuitem label="Rambler" />
            <jalios:menuitem label="Physics World" />
            <jalios:menuitem label="The New Scientist" />
          </jalios:submenu>
          <jalios:submenu label="Store" icon="glyph: fa fa-shopping-cart">
            <jalios:submenu label="Clothes" icon="glyph: fa fa-tags">
              <jalios:submenu label="Women's Clothing" icon="glyph: fa fa-female">
                <jalios:menuitem label="Tops" />
                <jalios:menuitem label="Dresses" />
                <jalios:menuitem label="Trousers" />
                <jalios:menuitem label="Shoes" />
                <jalios:menuitem label="Sale" />
              </jalios:submenu>
              <jalios:submenu label="Men's Clothing" icon="glyph: fa fa-male">
                <jalios:menuitem label="Shirts" />
                <jalios:menuitem label="Trousers" />
                <jalios:menuitem label="Shoes" />
                <jalios:menuitem label="Sale" />
              </jalios:submenu>
            </jalios:submenu>
            <jalios:menuitem label="Jewelry" />
            <jalios:menuitem label="Music" />
            <jalios:menuitem label="Grocery" />
          </jalios:submenu>
          <jalios:menuitem label="Collections" />
          <jalios:menuitem label="Credits" />
        </jalios:submenu>
        <jalios:submenu label="Other">
          <jalios:menuitem label="Collections" />
          <jalios:menuitem label="Credits" />
        </jalios:submenu>
      </jalios:menu>
    </div>
  </div><%-- EOF .bs-example --%>
  <div class="highlight"><pre><code><%= exampleMap.get("menu-static-example") %></code></pre></div>
  
  <h3 id="menu-menuinfo-example">Menus with MenuInfo implementation</h3>
  <div class="bs-example">
    <%
    MenuInfoFilter<Category> menuInfoFilter = (MenuInfoFilter<Category>) request.getAttribute(MenuInfoFilter.MENU_INFO_FILTER_ATTR);
    MenuInfo<Category> menuInfo = new CategoryMenuInfo(channel.getRootCategory(), null, true, -1, -1, null, menuInfoFilter, userLang, loggedMember, request);
    %>
    <h4>Menu with default JSP templates</h4>
    <jalios:menu name="defaultMenu">
    <%
    request.setAttribute(MenuInfo.MENU_INFO_ATTR, menuInfo);
    for (MenuInfo<Category> child : menuInfo.getChildren()) {
      if (child.isTreeNode() && Util.notEmpty(child.getChildren())) {
        request.setAttribute(MenuInfo.MENU_INFO_ATTR, child);
        %><jalios:include jsp="jcore/menu/doIterateSubMenu.jsp" /><%
        request.setAttribute(MenuInfo.MENU_INFO_ATTR, menuInfo);
      } else {
        %><jalios:menuitem id="<%= child.getId() %>" label="<%= child.getLabel() %>" link="<%= child.getLink() %>" active="<%= child.isActive() %>" parentId="<%= child.getParent() != null ? child.getParent().getId() : null %>" htmlAttributes="<%= child.getHtmlAttributes() %>" /><%
      }
    }
    %>
    </jalios:menu>
    
    <hr />
    
    <h4>Hover Menu</h4>
    <jalios:menu name="hoverMenu" menuResource="hover">
    <%
    request.setAttribute(MenuInfo.MENU_INFO_ATTR, menuInfo);
    for (MenuInfo<Category> child : menuInfo.getChildren()) {
      if (child.isTreeNode() && Util.notEmpty(child.getChildren())) {
        request.setAttribute(MenuInfo.MENU_INFO_ATTR, child);
        %><jalios:include jsp="jcore/menu/doIterateSubMenu.jsp" /><%
        request.setAttribute(MenuInfo.MENU_INFO_ATTR, menuInfo);
      } else {
        %><jalios:menuitem id="<%= child.getId() %>" label="<%= child.getLabel() %>" link="<%= child.getLink() %>" active="<%= child.isActive() %>" parentId="<%= child.getParent() != null ? child.getParent().getId() : null %>" htmlAttributes="<%= child.getHtmlAttributes() %>" /><%
      }
    }
    %>
    </jalios:menu>
    
    <hr />
    
    <h4>Vertical Menu</h4>
    <jalios:menu name="verticalMenu" menuResource="vertical">
    <%
    request.setAttribute(MenuInfo.MENU_INFO_ATTR, menuInfo);
    for (MenuInfo<Category> child : menuInfo.getChildren()) {
      if (child.isTreeNode() && Util.notEmpty(child.getChildren())) {
        request.setAttribute(MenuInfo.MENU_INFO_ATTR, child);
        %><jalios:include jsp="jcore/menu/doIterateSubMenu.jsp" /><%
        request.setAttribute(MenuInfo.MENU_INFO_ATTR, menuInfo);
      } else {
        %><jalios:menuitem id="<%= child.getId() %>" label="<%= child.getLabel() %>" link="<%= child.getLink() %>" active="<%= child.isActive() %>" parentId="<%= child.getParent() != null ? child.getParent().getId() : null %>" htmlAttributes="<%= child.getHtmlAttributes() %>" /><%
      }
    }
    %>
    </jalios:menu>
  </div><%-- EOF .bs-example --%>
  <div class="highlight"><pre><code><%= exampleMap.get("menu-menuinfo-example") %></code></pre></div>
  
  <h3 id="menu-menuinfofilter-example">Menus with MenuInfoFilter implementation</h3>
  <p>The following example shows how to implement MenuInfoFilter. The example of implementation adds '*' in the labels and will not accept more than 3 root menu items</p>
  <div class="bs-example">
  <%!
  class MyMenuInfoFilter implements MenuInfoFilter<Category> {
    
    private static final int MAX_ROOT_MENU_ITEM = 3;
    
    private int cpt = 0;
    
    public boolean isAccepted(MenuInfo<Category> menuInfo) {
      if(menuInfo.getTreeParent() == channel.getRootCategory()) {
        if(cpt < MAX_ROOT_MENU_ITEM) {
          cpt++;
          return true;
        } else {
          return false;
        }
      }
      return menuInfo.getParent() != null;
    }
    
    public MenuInfo<Category> update(MenuInfo<Category> menuInfo) {
      return new CategoryMenuInfo((CategoryMenuInfo) menuInfo) {
        public String getLabel() {
          return "* " + super.getLabel() + " *";
        }
      };
    }
  }
  %>
  <jalios:menu name="verticalMenu">
    <%
    MenuInfo<Category> myMenuInfo = new CategoryMenuInfo(channel.getRootCategory(), null, true, -1, -1, null, new MyMenuInfoFilter(), userLang, loggedMember, request);
    request.setAttribute(MenuInfo.MENU_INFO_ATTR, myMenuInfo);
    for (MenuInfo<Category> child : myMenuInfo.getChildren()) {
      if (child.isTreeNode() && Util.notEmpty(child.getChildren())) {
        request.setAttribute(MenuInfo.MENU_INFO_ATTR, child);
        %><jalios:include jsp="jcore/menu/doIterateSubMenu.jsp" /><%
        request.setAttribute(MenuInfo.MENU_INFO_ATTR, myMenuInfo);
      } else {
        %><jalios:menuitem id="<%= child.getId() %>" label="<%= child.getLabel() %>" link="<%= child.getLink() %>" active="<%= child.isActive() %>" parentId="<%= child.getParent() != null ? child.getParent().getId() : null %>" htmlAttributes="<%= child.getHtmlAttributes() %>" /><%
      }
    }
    %>
    </jalios:menu>
  </div><%-- EOF .bs-example --%>
  <div class="highlight"><pre><code><%= exampleMap.get("menu-menuinfofilter-example") %></code></pre></div>

</div><%-- EOF .bs-docs-section --%>