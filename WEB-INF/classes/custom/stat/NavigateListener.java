package custom.stat;

import com.jalios.jcms.portlet.PortalRedirect;
import com.jalios.jcms.stat.StatEntry;
import com.jalios.jcms.stat.beautifier.BeautifierData;
import com.jalios.jcms.stat.listener.AbstractStatMultiListener;
import com.jalios.jcms.stat.listener.StatFieldListener;
import com.jalios.util.Beautifier;

/** 
 * @author      Jean-Philippe Encausse
 * @since       jcms-5.0.0
 */
public class NavigateListener extends AbstractStatMultiListener{
  
  public NavigateListener(){
    super(ALL_AREA);
    addListener(new StatFieldListener(ALL_AREA, StatEntry.STAT_CURRENTCAT, "Entry", true));
  }
  
  @Override
  public boolean validateEntry(StatEntry entry) {
    
    if (!super.validateEntry(entry)){
      return false;
    }
    
    Object obj = entry.getStatObject(StatEntry.STAT_PORTAL);
    if (obj != null && obj instanceof PortalRedirect){
      return false;
    }
    
    return true;
  }
  
  /**
   * @see com.jalios.jcms.stat.listener.AbstractStatFieldListener#getBeautifier()
   */
  @Override
  public Beautifier getBeautifier() {
    if (beautifier == null){
      beautifier = new BeautifierData(TRUNCATE);
    }
    return super.getBeautifier();
  }
}
