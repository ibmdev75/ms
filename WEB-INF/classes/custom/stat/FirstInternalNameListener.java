
package custom.stat;


import com.jalios.jcms.Channel;
import com.jalios.jcms.stat.StatEntry;
import com.jalios.util.Util;

/** 
 * @author      Jean-Philippe Encausse
 * @since       jcms-5.6.0
 */
public class FirstInternalNameListener extends NameListener{
  
  protected String  channelUrl  = null;
  
  public FirstInternalNameListener(){
    super();
    
    channelUrl  = Channel.getChannel().getUrl().toLowerCase();
    if (channelUrl.endsWith("/"))
      channelUrl = channelUrl.substring(0,channelUrl.length()-1);
  }

  @Override
  public boolean validateEntry(StatEntry entry) {
    
    if (!super.validateEntry(entry)){
      return false;
    }
    
    String referer = entry.getStatValue(StatEntry.STAT_REFERER);
    
    // There is no referer -> First access to page
    if (Util.isEmpty(referer)){
      return true;
    }
    
    // Referer starts with channel URL
    referer = referer.toLowerCase();
    if (referer.startsWith(channelUrl))
      return false;
    
    // Referer doesn't starts with channel URL
    return false;
  }
}
