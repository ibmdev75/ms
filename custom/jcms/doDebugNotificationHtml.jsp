<%@ include file='/jcore/doInitPage.jspf' %>
<%  
	Map<Workspace,Collection<? extends Publication>> wsPubMap = new HashMap<Workspace, Collection<? extends Publication>>();
    
  String CRLF = System.getProperty("line.separator");
String A_VERY_LONG_TEXT = "A very long text with diacritics such éàç and せんせい."
      + CRLF
      + "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Ut elementum dui. Nunc non neque. Aenean ultrices, ipsum a vestibulum feugiat, est est euismod purus, in tincidunt lacus risus in quam. Fusce posuere, augue a tincidunt posuere, eros est congue enim, hendrerit lobortis sem massa at purus. Nulla euismod velit et massa placerat venenatis. Ut tincidunt risus ac mi. Praesent elementum sapien nec nibh. Nam at ante. Vestibulum et diam. Mauris eget velit nec purus molestie pellentesque. Aliquam lobortis accumsan nulla. Donec sapien augue, tristique a, vestibulum facilisis, porttitor eu, mauris. Curabitur fermentum mattis felis. Maecenas mi."
      + CRLF
      + "Nunc ornare sagittis risus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus id ante. Vestibulum vehicula. Ut dignissim turpis vel elit. Sed fermentum cursus libero. Integer sem est, vestibulum eget, viverra et, posuere porta, tellus. Pellentesque venenatis tortor rutrum mauris. Sed pellentesque dui quis lectus. Donec adipiscing purus vel sapien adipiscing lacinia. Aenean nec arcu. In id ante. Aenean eleifend tellus ut massa. Etiam imperdiet euismod lectus. Nunc felis est, viverra vitae, bibendum ac, euismod ut, augue. Duis eu ligula. Etiam viverra nonummy massa. Maecenas nibh lectus, consequat in, venenatis ac, semper non, leo. Ut varius. In est."
      + CRLF
      + "Nulla ipsum. Aliquam ullamcorper, est ut vehicula nonummy, tellus magna tempus nibh, vitae suscipit tortor ipsum non eros. Cras nonummy eros at magna. Etiam consequat. Fusce nonummy nonummy neque. Vestibulum ac dui nec purus viverra dignissim. Nullam semper velit et turpis. Quisque ac ipsum eu ante sollicitudin volutpat. Quisque dapibus quam sed arcu. Nunc eget dolor non orci vulputate convallis. Quisque porta enim a dolor. Fusce viverra semper arcu. Aenean vestibulum sollicitudin leo. Nam tempus, ligula nec venenatis facilisis, sapien ligula gravida sapien, eu ultricies mi urna in leo. Sed blandit, massa et aliquam ultricies, mi felis rhoncus felis, a dapibus lorem mi a quam. Nullam justo nisi, interdum sed, fringilla at, vehicula quis, lacus. Cras metus neque, tristique quis, vulputate nec, sollicitudin sed, leo. Sed sodales varius dui. Nunc luctus, risus id tempus nonummy, pede ante tempus dolor, nec pulvinar dui tellus eget lacus."
      + CRLF
      + "Maecenas porta posuere lacus. Maecenas lobortis ullamcorper eros. Aliquam rutrum. Sed eget eros. Maecenas rutrum. Nulla volutpat, dolor nec cursus suscipit, augue arcu feugiat lorem, ut adipiscing mauris enim dignissim lorem. Sed vulputate bibendum quam. Etiam in quam a enim gravida rutrum. Praesent gravida vestibulum tellus. Morbi ut neque sed nisl blandit aliquam. In neque."
      + CRLF
      + "Sed sit amet purus commodo tellus tempor adipiscing. Donec lacinia adipiscing quam. Morbi volutpat gravida magna. Maecenas fermentum erat sit amet erat. Morbi nunc leo, blandit id, eleifend eget, laoreet nec, augue. Donec aliquet dapibus sem. Nam mattis lacus sed metus. Integer turpis justo, nonummy ut, posuere eget, venenatis ac, odio. Nulla bibendum iaculis pede. Nulla pharetra. Donec facilisis ipsum at nunc. Nam vel lectus ac risus volutpat pulvinar. Phasellus adipiscing convallis velit."
      + CRLF
      + "Donec rutrum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin ligula enim, imperdiet quis, egestas vitae, posuere tincidunt, elit. Nunc pharetra, augue non dictum posuere, ante arcu mattis nulla, placerat pharetra nibh nisl non nulla. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed commodo. Quisque non ligula id nibh euismod imperdiet. Donec et augue. Nam sollicitudin. Aliquam laoreet mattis turpis. Vivamus luctus, est vitae tristique volutpat, quam metus tempus urna, ac euismod lacus tellus non turpis. Vivamus venenatis. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nunc iaculis eleifend pede. Nullam elementum, lacus eu ultrices aliquam, ligula eros feugiat nunc, ac suscipit velit eros at nisl. Etiam ac tortor eget odio placerat tempus. Sed ornare felis et urna. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur turpis duis."
      + CRLF + "End of the very long text.";

    
  Set<Workspace> wsSet = loggedMember.getWorkspaceSet();  
  
  int maxWs = 5;
  int wsCounter = 0;
  int pubCount = 0;
  
	for (Workspace itWs : wsSet) {
		  if (itWs.isModel()) {
		      continue;
		  }
		  
		  int min = 1;
		  int max = 7;
		  
		  int counter = min + (int)(Math.random() * ((max - min) + 1));	
	
	    List<Publication> pubList = new ArrayList<Publication>();

	    counter = 4;
	    
	    while(counter < max){
		    SmallNews smallNews = new SmallNews();
		    smallNews.setPstatus(WorkflowManager.PUBLISHED_PSTATUS);
		    smallNews.setWorkspace(itWs);
		    smallNews.setAuthor(loggedMember);
		    smallNews.setTitle(itWs.getTitle(userLang)+ " Small news" + counter);
		
		    smallNews.setIntro(A_VERY_LONG_TEXT);
		    smallNews.setContent("Content en");
        smallNews.setCdate(new Date());
        smallNews.addCategory(channel.getCategory("c_7394"));
        smallNews.addCategory(channel.getCategory("c_7395"));
	      pubList.add(smallNews);
	      counter++;
        pubCount++;
	    }	  
	      
	    
	    if (Util.isEmpty(pubList)) {
	       continue;
	    }
	    
	    if (wsCounter > maxWs) {
	       break;  
	    }

      WebPage webPage = new WebPage();
      webPage.setTitle(itWs.getTitle(userLang) + " WebPage");
      webPage.setDescription(A_VERY_LONG_TEXT);
	    webPage.setUrlToShot("http://www.jalios.com");
	    webPage.setUrl("http://www.jalios.com");
	    webPage.setWorkspace(itWs);
	    webPage.setAuthor(loggedMember);
	    webPage.addCategory(channel.getCategory("c_7394"));
	    webPage.setCdate(new Date());
	    pubList.add(webPage);
	    
	    wsPubMap.put(itWs,pubList);
	    wsCounter++;
	    pubCount++;
	}
  request.getSession().setAttribute(NotificationManager.CHANGES, wsPubMap);
  request.getSession().setAttribute(NotificationManager.PUBCOUNT, pubCount);
%>
<jalios:include jsp='/custom/jcms/doNotificationHtml.jsp'/>