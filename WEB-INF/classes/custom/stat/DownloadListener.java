package custom.stat;

import com.jalios.jcms.FileDocument;
import com.jalios.jcms.portlet.PortalElement;
import com.jalios.jcms.stat.PortletStat;
import com.jalios.jcms.stat.StatEntry;
import com.jalios.jcms.stat.beautifier.BeautifierData;
import com.jalios.jcms.stat.listener.StatPublicationListener;
import com.jalios.util.Beautifier;

/** 
 * @author      Jean-Philippe Encausse
 * @since       jcms-5.0.0
 */
public class DownloadListener extends StatPublicationListener {
  
  public DownloadListener(){
    super(ALL_AREA,"Entry",true,FileDocument.class,true);
  }
  
  @Override
  public void init(PortletStat portlet, PortalElement report) {
    super.init(portlet, report);
    setZone("Download");
  }
  
  /**
   * Validate the FileDocument is not viewed in detail mode
   * @see com.jalios.jcms.stat.listener.AbstractStatFieldListener#validateEntry(StatEntry)
   * @since jcms-4.2
   */ 
  @Override
  public boolean validateEntry(StatEntry entry){
    
    if (!super.validateEntry(entry)){
      return false;
    }
    
    return true;
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
