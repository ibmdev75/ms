package custom.stat;

import com.jalios.jcms.Channel;
import com.jalios.jcms.stat.StatEntry;
import com.jalios.jcms.stat.listener.StatFieldListener;
import com.jalios.util.Beautifier;
import com.jalios.util.BeautifierUrl;

/** 
 * @author      Jean-Philippe Encausse
 * @since       jcms-5.0.0
 */
public class RefererListener extends StatFieldListener{
 
  public static final int  REFERER_ALL      = 0;
  public static final int  REFERER_INTERNAL = 1;
  public static final int  REFERER_EXTERNAL = 2;
  
  protected int     kind        = 0;
  protected String  referer     = null;
  protected String  channelUrl  = null;
  protected int     refererCut  = 0;
  
  // --------------------------------------------------------------------------------------------
  // Constructors
  // --------------------------------------------------------------------------------------------
  
  public RefererListener(){
    this(ALL_AREA, "Entry", REFERER_EXTERNAL);
  }
  
  public RefererListener(String zone ,String mapKey , int kind){
    super(zone, StatEntry.STAT_REFERER, mapKey, true);
    this.kind = kind;
    channelUrl  = Channel.getChannel().getUrl().toLowerCase();
    if (channelUrl.endsWith("/"))
      channelUrl = channelUrl.substring(0,channelUrl.length()-1);
    refererCut  = channelUrl.length();
  }
  
  // --------------------------------------------------------------------------------------------
  // Process Entry
  // --------------------------------------------------------------------------------------------

  /**
   * @see com.jalios.jcms.stat.listener.AbstractStatFieldListener#validateEntry(StatEntry)
   * @since jcms-4.2
   */
  @Override
  public boolean validateEntry(StatEntry entry) {
    if (!super.validateEntry(entry)){
      return false;
    }
    
    referer = (String) getCurrentObjSet().first();
    referer = referer.toLowerCase();
    
    
    if (referer.startsWith(channelUrl)){
      if (kind != REFERER_INTERNAL)
        return false;
      referer = referer.substring(refererCut);
    }
    else{
      if (kind == REFERER_INTERNAL)
        return false;
    }
    if (referer.endsWith("/")){
      referer = referer.substring(0,referer.length()-1);
    }
    getCurrentObjSet().clear();
    getCurrentObjSet().add(referer);
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
