package custom.stat;

import com.jalios.jcms.Member;
import com.jalios.jcms.stat.StatEntry;
import com.jalios.jcms.stat.beautifier.BeautifierData;
import com.jalios.jcms.stat.listener.AbstractStatMultiListener;
import com.jalios.jcms.stat.listener.StatDataListener;
import com.jalios.util.Beautifier;

/** 
 * @author      Jean-Philippe Encausse
 * @since       jcms-5.0.0
 */
public class MemberListener extends AbstractStatMultiListener{

  public MemberListener(){
    this(ALL_AREA,"Entry");
  }
  
  public MemberListener(String zone, String mapKey){
    super(zone);
    addListener(new StatDataListener(ALL_AREA, StatEntry.STAT_MEMBER, mapKey,true,Member.class,false));
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
