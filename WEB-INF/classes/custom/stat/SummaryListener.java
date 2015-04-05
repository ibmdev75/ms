package custom.stat;

import java.util.Map;

import com.jalios.jcms.stat.StatEntry;
import com.jalios.jcms.stat.StatManager;
import com.jalios.jcms.stat.listener.AbstractStatFieldListener;
import com.jalios.jcms.stat.listener.AbstractStatMultiListener;
import com.jalios.jcms.stat.listener.StatRequestListener;
import com.jalios.jcms.stat.listener.StatSessionListener;
import com.jalios.util.Util;

/**
 * Summarize the analyse
 * 
 * @author      Jean-Philippe Encausse
 * @since       jcms-5.0.0
 */
public class SummaryListener extends AbstractStatMultiListener{
 
  public StatRequestListener request      = null;
  public StatSessionListener session      = null;
  public long                lineCount    = 0;
  
  public SummaryListener(){
    super(null);

    request = new StatRequestListener(100);
    session = new StatSessionListener();
    display = "displaySummary.jsp";
    
    addListener(request);
    addListener(session);
  }
  

  @Override
  public boolean validateEntry(StatEntry entry) {
    lineCount++;
    return super.validateEntry(entry);
  }
  
  /**
   * @see AbstractStatFieldListener#processEntry(StatEntry, Object, Map)
   * @since jcms-4.2
   */
  @Override
  public void processEntry(StatEntry entry, Object workspace, Map workspaceMap){
    
    super.processEntry(entry, workspace, workspaceMap);
    
    long[] summary    = (long[]) getWorkspaceFieldMap(workspace , "Entry" , new long[]{0,0,0,0,0} , workspaceMap);
    
    // Count the number of lines
    if (!StatManager.matchPattern(entry)){
      summary[0]++;
    }
    
    // Update the analyse range date of the report
    if (summary[1]    == 0){ 
      summary[1]    = Util.toLong(entry.getStatValue(StatEntry.STAT_DATESTART),0); 
    }
    summary[2]    = Util.toLong(entry.getStatValue(StatEntry.STAT_DATESTART),0);
    
    // Update the analyse duration of the report
    if (summary[3]    == 0){ 
      summary[3]    = System.currentTimeMillis();  
    }
    summary[4]    = System.currentTimeMillis();
  }
}






