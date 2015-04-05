package custom.stat;

import com.jalios.jcms.portlet.PortalElement;
import com.jalios.jcms.stat.PortletStat;
import com.jalios.jcms.stat.StatEntry;
import com.jalios.jcms.stat.listener.AbstractStatMultiListener;
import com.jalios.jcms.stat.listener.StatFieldListener;

/** 
 * @author      Jean-Philippe Encausse
 * @since       jcms-5.0.0
 */
public class AreaListener extends AbstractStatMultiListener{

  public AreaListener(){
    super(ALL_AREA);
    
    addListener(new StatFieldListener(ALL_AREA, StatEntry.STAT_ZONE, "Entry", true,"Unknown"));
  }
  
  /**
   * @see com.jalios.jcms.stat.StatListener#init(PortletStat,PortalElement)
   * @since jcms-4.2
   */
  @Override
  public void init(PortletStat portlet, PortalElement report){
    super.init(portlet,report);
    if (dayWeekListener != null){
      dayWeekListener.setRefine(StatEntry.STAT_ZONE);
    }
  }
}
