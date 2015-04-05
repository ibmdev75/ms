package custom.stat;

import com.jalios.jcms.Channel;
import com.jalios.jcms.portlet.PortalRedirect;
import com.jalios.jcms.stat.StatEntry;
import com.jalios.jcms.stat.listener.AbstractStatMultiListener;
import com.jalios.jcms.stat.listener.StatFieldListener;
import com.jalios.util.Beautifier;
import com.jalios.util.BeautifierRegexp;

/** 
 * @author      Jean-Philippe Encausse
 * @since       jcms-5.0.0
 */
public class NameListener extends AbstractStatMultiListener{
  
  public NameListener(){
    super(ALL_AREA);
    addListener(new StatFieldListener(ALL_AREA,StatEntry.STAT_NAME, "Entry", false, "No page title"));
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
    String match = Channel.getChannel().getName()+" - ";
    return new BeautifierRegexp(new String[]{"("+match+"?)(.*)"},new String[]{"$2"},TRUNCATE);
  }
}
