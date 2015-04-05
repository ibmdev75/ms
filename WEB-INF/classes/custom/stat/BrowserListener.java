package custom.stat;

import com.jalios.jcms.stat.StatEntry;
import com.jalios.jcms.stat.beautifier.BeautifierBrowser;
import com.jalios.jcms.stat.listener.AbstractStatMultiListener;
import com.jalios.jcms.stat.listener.StatFieldListener;
import com.jalios.util.Beautifier;

/** 
 * @author      Jean-Philippe Encausse
 * @since       jcms-5.0.0
 */
public class BrowserListener extends AbstractStatMultiListener{

  public BrowserListener(){
    super(ALL_AREA);
    addListener(new StatFieldListener(ALL_AREA,StatEntry.STAT_BROWSER, "Entry", false,"Unknown"));
  }

  /** 
   * @see com.jalios.jcms.stat.listener.AbstractStatFieldListener#getBeautifier()
   */
  @Override
  public Beautifier getBeautifier() {
    return new BeautifierBrowser(TRUNCATE);
  }
  
}
