package custom.stat;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.SortedSet;
import java.util.TreeSet;

import com.jalios.jcms.stat.StatEntry;
import com.jalios.jcms.stat.listener.AbstractStatMultiListener;
import com.jalios.jcms.stat.listener.StatFieldListener;
import com.jalios.util.ObjectIntTreeMap;
import com.jalios.util.Util;

/** 
 * @author      Jean-Philippe Encausse
 * @since       jcms-5.0.0
 */
public class ReqSessionListener extends AbstractStatMultiListener{
    
  protected StatFieldListener listener  = null;
  protected String            day       = null;
  protected String            session   = null;
  protected SimpleDateFormat  sdfDay    = new SimpleDateFormat("y D");
  
  // --------------------------------------------------------------------------------------------
  // Constructors
  // --------------------------------------------------------------------------------------------
  
  public ReqSessionListener(){
    this(ALL_AREA,null);
  }
  
  public ReqSessionListener(String zone , StatFieldListener listener){
    super(zone);

    if (listener != null){
      this.listener = listener;
      addListener(listener);
    }
  }
  // --------------------------------------------------------------------------------------------
  // Validate Entry
  // --------------------------------------------------------------------------------------------

  
  /**
   * @see com.jalios.jcms.stat.listener.AbstractStatFieldListener#validateEntry(StatEntry)
   * @since jcms-4.2
   */ 
  @Override
  public boolean validateEntry(StatEntry entry){
    if (!super.validateEntry(entry))
      return false;
    
    long startDate = Util.toLong(entry.getStatValue(StatEntry.STAT_DATESTART),0);
    day     = sdfDay.format(new Date(startDate));
    session = entry.getStatValue(StatEntry.STAT_SESSIONID);
    
    return true;
  }

  
  // --------------------------------------------------------------------------------------------
  // Process Entry
  // --------------------------------------------------------------------------------------------
 
  /**
   * Assume Session ID are Unique for a Member in a given Day
   * @see com.jalios.jcms.stat.listener.AbstractStatFieldListener#processEntry(StatEntry, Object, Map)
   * @since jcms-4.2
   */
  @Override
  public void processEntry(StatEntry entry, Object workspace , Map workspaceMap){
    super.processEntry(entry,workspace,workspaceMap);
    
    SortedSet visitors = listener.getCurrentObjSet();
    if (Util.isEmpty(visitors)){
      visitors = new TreeSet();
      visitors.add("Unknown Visitor");
    }
    
    processDay(visitors, workspace, workspaceMap);
  }
  
  int count = 0;
  /**
   * Convenient Method that do the job
   * 
   * @param visitors
   * @param workspace
   * @param workspaceMap
   * @since jcms-4.2
   */
  protected void processDay(SortedSet visitors, Object workspace, Map workspaceMap){
    Map dayMap = (Map) getWorkspaceFieldMap(workspace, "visitorDay", new ObjectIntTreeMap(), workspaceMap);
    
    //  DAYS -> VISITORS
    Map visitorMap = (Map) dayMap.get(day);
    if (visitorMap == null){
      visitorMap = new ObjectIntTreeMap();
      dayMap.put(day,visitorMap);
    }
    
    for (Iterator it = visitors.iterator(); it.hasNext(); ) {
      Object itVisitor = it.next();
      if (itVisitor == null){
        continue;
      }
      //  VISITORS -> SESSION
      ObjectIntTreeMap sessionMap = (ObjectIntTreeMap) visitorMap.get(itVisitor);
      if (sessionMap == null){
        sessionMap = new ObjectIntTreeMap();
        visitorMap.put(itVisitor,sessionMap);
      }
      String tmpSession = session;
      if (Util.isEmpty(tmpSession)){
        tmpSession = itVisitor+"_session";
      }
      sessionMap.inc(tmpSession);
    }
  }
  
}
