package custom.stat;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.jalios.jcms.stat.StatEntry;
import com.jalios.util.Util;

/**
 * @author Jean-Philippe Encausse
 * @since jcms-4.2
 */
public class PortalVisitorListener extends PortalListener{

  protected SimpleDateFormat  sdfDay     = new SimpleDateFormat("y D");
  protected Set               visitorSet = new HashSet();
  protected String            visitorDay = "";
  
  // --------------------------------------------------------------------------------------------
  // Constructors
  // --------------------------------------------------------------------------------------------
  
  public PortalVisitorListener(){
    super(false);
  }

  // --------------------------------------------------------------------------------------------
  // Validate Entry
  // --------------------------------------------------------------------------------------------
  
  /**
   * Validate the Portal is 
   * @see com.jalios.jcms.stat.listener.AbstractStatFieldListener#validateEntry(StatEntry)
   * @since jcms-5.6.0
   */ 
  @Override
  public boolean validateEntry(StatEntry entry){
  
    if (!super.validateEntry(entry)){
      return false;
    }
    
    // Move code to a single listener ?
    // Allowing used by other listeners for crossing ?
    
    long startDate = Util.toLong(entry.getStatValue(StatEntry.STAT_DATESTART),0);
    
    String day       = sdfDay.format(new Date(startDate));
    String addressip = entry.getStatValue(StatEntry.STAT_IPADDRESS);
    String session   = entry.getStatValue(StatEntry.STAT_SESSIONID);
    String portalId  = entry.getStatValue(StatEntry.STAT_PORTAL);
    
    if (!visitorDay.equals(day)){
      visitorSet.clear();
      visitorDay = day;
    }
    
    String concat = ""+portalId+addressip+session;
    if(visitorSet.contains(concat))
      return false;
    
    visitorSet.add(concat);
    return true;
  }
}
