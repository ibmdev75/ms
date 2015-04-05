package custom.stat;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.SortedSet;
import java.util.TreeMap;

import com.jalios.jcms.Category;
import com.jalios.jcms.stat.StatEntry;
import com.jalios.jcms.stat.listener.AbstractStatMultiListener;
import com.jalios.jcms.stat.listener.StatDataListener;
import com.jalios.jcms.stat.listener.StatMatchPatternListener;
import com.jalios.util.ObjectIntTreeMap;
import com.jalios.util.Util;

/** 
 * @author      Jean-Philippe Encausse
 * @since       jcms-5.0.0
 */
public class PathListener extends AbstractStatMultiListener{
  
  public TreeMap refurlMap = null;
  public TreeMap urlrefMap = null;

  protected RefererListener refListener  = null;
  protected UrlListener     urlListener  = null;
  protected StatDataListener    dataListener = null;
  
  public PathListener(){
    super(ALL_AREA);
    
    //display      = "displayPath.jsp";
    refurlMap    = new TreeMap();
    urlrefMap    = new TreeMap();
    dataListener = new StatDataListener(ALL_AREA,StatEntry.STAT_DATA,null,true,Category.class,false);
    refListener  = new RefererListener(ALL_AREA,null,RefererListener.REFERER_ALL);
    urlListener  = new UrlListener(ALL_AREA,null,".*display.jsp.*",".*"); // TODO: JP : Adapt for DescriptiveURLs
    
    addListener(new StatMatchPatternListener(ALL_AREA, StatEntry.STAT_QUERYSTRING,null,true,"|id=[^&]*"));
    addListener(dataListener);
    addListener(refListener);
    addListener(urlListener);
    
  }
  
 @Override
public void processEntry(StatEntry entry, Object workspace, Map workspaceMap) {
    super.processEntry(entry, workspace, workspaceMap);
  
    String url     = (String) refListener.getCurrentObjSet().first();
    String referer = (String) urlListener.getCurrentObjSet().first();
    
    
    // 1 URL -> REFERER
    ObjectIntTreeMap refererCount = (ObjectIntTreeMap) urlrefMap.get(url);
    if (refererCount == null){
      refererCount = new ObjectIntTreeMap();
      urlrefMap.put(url,refererCount);
    }
    refererCount.inc(referer);

    
    // 2 REFERER -> URL
    ObjectIntTreeMap urlCount = (ObjectIntTreeMap) refurlMap.get(referer);
    if (urlCount == null){
      urlCount = new ObjectIntTreeMap();
      refurlMap.put(referer,urlCount);
    }
    urlCount.inc(url);
  }
  
  /**
   * Return the top N 
   * @return a List of Url
   * @since jcms-4.2
   */
  public List getMostAccessUrl(Object url , int qt){
    List      urlList = new ArrayList();
    TreeMap   urls    = (TreeMap) refurlMap.get(url);
    
    if (Util.isEmpty(urls)){
      return urlList;
    }
    
    SortedSet urlSet  = ObjectIntTreeMap.getSortedMapEntrySet(urls, ObjectIntTreeMap.getGreaterComparator());
    
    for (Iterator it = urlSet.iterator(); it.hasNext() && qt > 0; qt--) {
      Map.Entry itEntry = (Map.Entry) it.next();
      urlList.add(itEntry.getKey());
    }
    return urlList;
  }
  
  /**
   * Return the top N 
   * @return a List of Url
   * @since jcms-4.2
   */
  public List getMostAccessReferer(Object url , int qt){
    List      refererList = new ArrayList();
    TreeMap   referers    = (TreeMap) urlrefMap.get(url);
    
    if (Util.isEmpty(referers)){
      return refererList;
    }
    
    SortedSet refererSet  = ObjectIntTreeMap.getSortedMapEntrySet(referers, ObjectIntTreeMap.getGreaterComparator());
    
    for (Iterator it = refererSet.iterator(); it.hasNext() && qt > 0; qt--) {
      Map.Entry itEntry = (Map.Entry) it.next();
      refererList.add(itEntry.getKey());
    }
    return refererList;
  }
  
  /**
   * Return the Most use Path on N levels for a given starting url
   * @param url
   * @param level
   * @return a List of Url
   * @since jcms-4.2
   */
  
  public List getMostUsedPath(Object url , int level){
    List list = new ArrayList();
    list.add(url);
    
    for (int i = 0 ; i < level ; i++){
      
      List l = getMostAccessUrl(url , level);
      if (Util.isEmpty(l)){
        break;
      }
      
      // Get the first new next url
      String tmp = null;
      for (Iterator it = l.iterator(); it.hasNext();) {
        String itString = (String) it.next();
        if (list.contains(itString)){
          continue;
        }
        tmp = itString;
        break;
      }
      
      if (tmp == null){
        break;
      }
      
      url = tmp;
      list.add(url);
    }
    return list;
  }

}
