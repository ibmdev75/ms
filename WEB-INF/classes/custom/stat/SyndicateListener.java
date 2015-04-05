
package custom.stat;

import org.apache.log4j.Logger;

import com.jalios.jcms.Channel;
import com.jalios.jcms.stat.StatEntry;
import com.jalios.jcms.stat.beautifier.BeautifierData;
import com.jalios.jcms.stat.listener.AbstractStatMultiListener;
import com.jalios.jcms.stat.listener.StatDataListener;
import com.jalios.util.Beautifier;

/** 
 * @author      Jean-Philippe Encausse
 * @since       jcms-5.0.0
 */
public class SyndicateListener extends AbstractStatMultiListener{
  
  private static final Logger logger = Logger.getLogger(Channel.class);
  
  public SyndicateListener(){
    super(FEED_AREA);
    try{
      addListener(new StatDataListener(FEED_AREA,StatEntry.STAT_DATA,"Entry",true,Channel.getChannel().getClass("generated.PortletFeed"),false));
    }
    catch (Exception ex){
      logger.warn(ex);
    }
  }
  
  /** 
   * @see com.jalios.jcms.stat.listener.AbstractStatFieldListener#getBeautifier()
   */
  @Override
  public Beautifier getBeautifier() {
    return new BeautifierData(TRUNCATE);
  }
}
