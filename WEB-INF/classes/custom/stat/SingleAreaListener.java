package custom.stat;

import com.jalios.jcms.stat.StatEntry;
import com.jalios.jcms.stat.listener.AbstractStatMultiListener;
import com.jalios.jcms.stat.listener.StatFieldListener;

/** 
 * @author      Jean-Philippe Encausse
 * @since       jcms-5.0.0
 */
public class SingleAreaListener extends AbstractStatMultiListener{

  public SingleAreaListener(){
    super(ALL_AREA);
    addListener(new StatFieldListener(ALL_AREA,StatEntry.STAT_IPADDRESS, "Entry", true));
  }

}
