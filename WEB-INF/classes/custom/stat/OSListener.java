package custom.stat;

import com.jalios.jcms.stat.StatEntry;
import com.jalios.jcms.stat.beautifier.BeautifierOS;
import com.jalios.jcms.stat.listener.AbstractStatMultiListener;
import com.jalios.jcms.stat.listener.StatFieldListener;
import com.jalios.util.Beautifier;

/** 
 * @author      Jean-Philippe Encausse
 * @since       jcms-5.0.0
 */
public class OSListener extends AbstractStatMultiListener{
  
  public OSListener(){
    super(ALL_AREA);
    addListener(new StatFieldListener(ALL_AREA, StatEntry.STAT_OS, "Entry", false, "Unknown"));
  }
  
  /** 
   * @see com.jalios.jcms.stat.listener.AbstractStatFieldListener#getBeautifier()
   */
  @Override
  public Beautifier getBeautifier() {
    return new BeautifierOS(TRUNCATE);
  }
}
