
package custom.stat;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

import com.jalios.jcms.stat.StatEntry;
import com.jalios.jcms.stat.listener.AbstractStatFieldListener;
import com.jalios.jcms.stat.listener.AbstractStatMultiListener;
import com.jalios.util.Util;

/**
 * 
 * This is a sample stat listener used to listen simple visit
 * when the VisitorListener is too complicated.
 * It should be used for custom reports.
 * 
 * @author Jean-Philippe Encausse
 * @since jcms-4.2
 * @see custom.stat.VisitorListener
 */
public class SimpleVisitorListener extends AbstractStatMultiListener{

  protected SimpleDateFormat  sdfDay     = new SimpleDateFormat("y D");
  protected Set               visitorSet = new HashSet();
  protected String            visitorDay = "";
  protected String            concat     = null;
  
  // --------------------------------------------------------------------------------------------
  // Constructors
  // --------------------------------------------------------------------------------------------
  
  public SimpleVisitorListener(){
    super(ALL_AREA);
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
    concat = null;
    if (!super.validateEntry(entry)){
      return false;
    }
    
    // Move code to a single listener ?
    // Allowing used by other listeners for crossing ?
    
    long startDate = Util.toLong(entry.getStatValue(StatEntry.STAT_DATESTART),0);
    
    String day       = sdfDay.format(new Date(startDate));
    String addressip = entry.getStatValue(StatEntry.STAT_IPADDRESS);
    String session   = entry.getStatValue(StatEntry.STAT_SESSIONID);
    
    if (!visitorDay.equals(day)){ // Not really acurate but fast
      visitorSet.clear();
      visitorDay = day;
    }
    
    concat = addressip+" - "+session;
    if(visitorSet.contains(concat))
      return false;
    
    visitorSet.add(concat);
    return true;
  }
  
  /**
   * @see AbstractStatFieldListener#processEntry(StatEntry, Object, Map)
   * @since jcms-5.0.0
   */
  @Override
  public void processEntry(StatEntry entry, Object workspace, Map workspaceMap){
    super.processEntry(entry,workspace,workspaceMap);
    
    if (Util.isEmpty(concat)){
      return;
    }
    
    updateWorkspaceMap(workspace , "Entry" , concat, null, workspaceMap);
  }
  
  @Override
  public SortedSet getCurrentObjSet(String mapKey) {
    if (Util.isEmpty(concat)){
      return Util.EMPTY_TREESET;
    }
    
    SortedSet tmpSet = new TreeSet();
    tmpSet.add(concat);
    
    if (mapKey == null)
      return tmpSet;
    
    if (mapKey.equals("Entry"))
      return tmpSet;
    
    return Util.EMPTY_TREESET;
  }
}
