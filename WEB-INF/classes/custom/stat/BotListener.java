package custom.stat;

import com.jalios.jcms.Channel;
import com.jalios.jcms.stat.StatEntry;
import com.jalios.jcms.stat.beautifier.BeautifierBrowser;
import com.jalios.jcms.stat.listener.StatMatchPatternListener;
import com.jalios.util.Beautifier;

/** 
 * @author      Jean-Philippe Encausse
 * @since       jcms-5.0.0
 */
public class BotListener extends StatMatchPatternListener{
  
  public BotListener(){
    super(ALL_AREA, StatEntry.STAT_USERAGENT, "Entry", true, Channel.getChannel().getProperty("statreporter.regexp.userAgent"));
  }
  
  /** 
   * @see com.jalios.jcms.stat.listener.AbstractStatFieldListener#getBeautifier()
   */
  @Override
  public Beautifier getBeautifier() {
    return new BeautifierBrowser(TRUNCATE);
  }
}
