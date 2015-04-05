package custom.stat;

import com.jalios.jcms.stat.StatEntry;
import com.jalios.jcms.stat.listener.StatFieldListener;

/**
 * @author      Jean-Philippe Encausse
 * @since       jcms-5.0.0
 */
public class VisitorListener extends ReqSessionListener {

  public VisitorListener(){
    super(ALL_AREA,new StatFieldListener(ALL_AREA,StatEntry.STAT_IPADDRESS, "Entry", true));
    display  = "displayVisitor.jsp";
  }

}
