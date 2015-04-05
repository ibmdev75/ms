package custom.stat;

import com.jalios.jcms.ResourceHelper;
import com.jalios.jcms.stat.StatEntry;
import com.jalios.jcms.stat.listener.AbstractStatFieldListener;
import com.jalios.jcms.stat.listener.AbstractStatMultiListener;
import com.jalios.jcms.stat.listener.StatFieldListener;
import com.jalios.util.ServletUtil;
import com.jalios.util.Util;

/**
 * Display information about the search engine use: Word, Types, Categories
 * used in display.jsp and query.jsp
 * 
 * @author      Jean-Philippe Encausse
 * @since       jcms-4.2
 */
public class SearchListener extends AbstractStatMultiListener{

  private static String[] ALLOWED_URI = new String[]{"query.jsp", ResourceHelper.getQuery() };
  private static String[] ALLOWED_QS  = new String[]{"jsp=front%2Fquery.jsp", "jsp="+ServletUtil.encodeURL(ResourceHelper.getQuery())};
  
  public SearchListener(){
    super(ALL_AREA);
    display  = "displaySearch.jsp";
    addListener(new StatFieldListener(ALL_AREA, StatEntry.STAT_SEARCH_FULLTEXT, "Search_FullText" , false));
    addListener(new StatFieldListener(ALL_AREA, StatEntry.STAT_SEARCH_CATEGORY, "Search_Category" , false));
    addListener(new StatFieldListener(ALL_AREA, StatEntry.STAT_SEARCH_TYPES   , "Search_Types"    , false));
  }
  
  /**
   * @see AbstractStatFieldListener#validateEntry(StatEntry)
   * @since jcms-4.2
   */ 
  @Override
  public boolean validateEntry(StatEntry entry){  
    
    String uri = entry.getStatValue(StatEntry.STAT_URI);
    if (Util.isEmpty(uri)){
      return false;
    }
    
    for (int i = 0; i < ALLOWED_URI.length; i++) {
      if (uri.indexOf(ALLOWED_URI[i]) != -1){
        return super.validateEntry(entry);
      }
    }

    String qs = entry.getStatValue(StatEntry.STAT_QUERYSTRING);
    if (Util.isEmpty(qs)){
      return false;
    }
    
    for (int i = 0; i < ALLOWED_QS.length; i++) {
      if (qs.indexOf(ALLOWED_QS[i]) != -1){
        return super.validateEntry(entry);
      }
    }

    return false;
  }
}
