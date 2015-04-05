package custom.stat;

import com.jalios.jcms.portlet.PortalInterface;
import com.jalios.jcms.portlet.PortalRedirect;
import com.jalios.jcms.stat.StatEntry;
import com.jalios.jcms.stat.beautifier.BeautifierData;
import com.jalios.jcms.stat.listener.AbstractStatMultiListener;
import com.jalios.jcms.stat.listener.StatDataListener;
import com.jalios.util.Beautifier;

/**
 * @author Jean-Philippe Encausse
 * @since jcms-4.2
 */
public class PortalListener extends AbstractStatMultiListener{
    
  protected boolean                redirect       = false;
  protected StatDataListener       portalListener = null;  

  // --------------------------------------------------------------------------------------------
  // Constructors
  // --------------------------------------------------------------------------------------------
  
  public PortalListener(){
    this(false);
  }
  
  public PortalListener(boolean redirect){
    super(ALL_AREA);
    this.redirect = redirect;
    portalListener = new StatDataListener(ALL_AREA, StatEntry.STAT_PORTAL,"Entry",true,PortalInterface.class,true);
    addListener(portalListener);
  }

  // --------------------------------------------------------------------------------------------
  // Validate Entry
  // --------------------------------------------------------------------------------------------
  
  /**
   * Validate the Portal is 
   * @see com.jalios.jcms.stat.listener.AbstractStatFieldListener#validateEntry(StatEntry)
   * @since jcms-4.2
   */ 
  @Override
  public boolean validateEntry(StatEntry entry){
  
    if (!super.validateEntry(entry)){
      return false;
    }
    Object obj =  portalListener.getCurrentObjSet().first();
    
    return !(redirect ^ (obj instanceof PortalRedirect));
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
