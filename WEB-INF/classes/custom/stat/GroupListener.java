package custom.stat;

import com.jalios.jcms.Group;
import com.jalios.jcms.stat.StatEntry;
import com.jalios.jcms.stat.beautifier.BeautifierData;
import com.jalios.jcms.stat.listener.AbstractStatMultiListener;
import com.jalios.jcms.stat.listener.StatDataListener;
import com.jalios.util.Beautifier;

/**
 * @author      Jean-Philippe Encausse
 * @since       jcms-5.0.0
 * NB: How to I18N
 */
public class GroupListener extends AbstractStatMultiListener{

  public GroupListener(){
    this(ALL_AREA,"Entry");
  }
  
  public GroupListener(String zone, String mapKey){
    super(zone);
    addListener(new StatDataListener(zone, StatEntry.STAT_GROUPS,mapKey,true,Group.class,true));
  }
  
  /**
   * @see com.jalios.jcms.stat.listener.AbstractStatFieldListener#getBeautifier()
   */
  @Override
  public Beautifier getBeautifier() {
    if (beautifier == null){
      beautifier = new BeautifierData(TRUNCATE);
    }
    return super.getBeautifier();
  }
}
