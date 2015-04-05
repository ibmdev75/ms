package custom.stat;

import com.jalios.jcms.Content;
import com.jalios.jcms.FileDocument;
import com.jalios.jcms.stat.StatEntry;
import com.jalios.jcms.stat.beautifier.BeautifierData;
import com.jalios.jcms.stat.listener.StatPublicationListener;
import com.jalios.util.Beautifier;

/** 
 * @author      Jean-Philippe Encausse
 * @since       jcms-5.0.0
 */
public class ContentListener extends StatPublicationListener {
  
  public ContentListener(){
    super(ALL_AREA,"Entry",true,Content.class,true);
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
    
    Class tmpObjClass = getStatEntryClass(entry);
    if (!tmpObjClass.isAssignableFrom(FileDocument.class)){
      return true;
    }
    
    String objDetail = entry.getStatValue(StatEntry.STAT_QUERYSTRING);
    if ((objDetail == null) || (objDetail.indexOf("details=true") >= 0)){
      return true;
    }
    
    return false;
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
