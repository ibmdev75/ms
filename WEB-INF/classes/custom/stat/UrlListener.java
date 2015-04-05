package custom.stat;

import com.jalios.jcms.stat.StatEntry;
import com.jalios.jcms.stat.listener.StatMatchPatternListener;
import com.jalios.util.Beautifier;
import com.jalios.util.BeautifierUrl;
import com.jalios.util.Util;

/**
 * @author      Jean-Philippe Encausse
 * @since       jcms-5.0.0
 */
public class UrlListener extends StatMatchPatternListener {
  
  protected StatMatchPatternListener qsListener  = null;
  
  // --------------------------------------------------------------------------------------------
  // Constructors
  // --------------------------------------------------------------------------------------------
  
  public UrlListener(){
    this(ALL_AREA,"Entry");
  }
  
  public UrlListener(String zone , String mapKey){
    this(zone,mapKey,".*",".*");
  }
  public UrlListener(String zone , String mapKey , String uriPattern , String qsPattern ){
    super(zone, StatEntry.STAT_URI, mapKey, true, uriPattern == null ? null : "|"+uriPattern);
    qsListener = new StatMatchPatternListener(zone, StatEntry.STAT_QUERYSTRING,null,false,"|"+qsPattern);
    addListener(qsListener);
  }
  
  // --------------------------------------------------------------------------------------------
  // Process Entry
  // --------------------------------------------------------------------------------------------

  @Override
  public boolean validateEntry(StatEntry entry) {
    if(!super.validateEntry(entry)){
      return false;
    }
    
    String uri = (String) getCurrentObjSet().first();
    String url = uri + (Util.isEmpty(qsListener.getCurrentObjSet()) ? "" : ("?"+(String) qsListener.getCurrentObjSet().first()));
    
    getCurrentObjSet().clear();
    getCurrentObjSet().add(url);
    
    return true;
  }
  
  /** 
   * @see com.jalios.jcms.stat.listener.AbstractStatFieldListener#getBeautifier()
   */
  @Override
  public Beautifier getBeautifier() {
    return new BeautifierUrl(TRUNCATE);
  }
}
