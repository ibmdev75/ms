package custom;

import generated.WebPage;

import java.util.Iterator;
import java.util.TreeSet;

import com.jalios.jcms.BasicDataController;
import com.jalios.jcms.Channel;
import com.jalios.jcms.ControllerStatus;
import com.jalios.jcms.Data;
import com.jalios.util.Util;

/**
 * Check unicity of webpage's url (for webpage of same workspace).
 * @author Olivier Jaquemet <olivier.jaquemet@jalios.com>
 * @since jcms-5.0.0
 */
public class WebPageController extends BasicDataController {
 
  @Override
  public ControllerStatus checkIntegrity(Data data) {
    WebPage webPage = (WebPage) data;

    if (webPage.getUrl() == null) {
      ControllerStatus status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", Channel.getChannel().getTypeFieldLabel(WebPage.class, "url"), null);
      return status;        
    }
    
    TreeSet webPageSet = Channel.getChannel().getAllDataSet(WebPage.class);
    for (Iterator itWP = webPageSet.iterator(); itWP.hasNext(); ) {
      WebPage curWebPage = (WebPage) itWP.next();

      // only check unicity of WebPage in same workspace, of same author
      if (curWebPage.getWorkspace() != webPage.getWorkspace() ||
          curWebPage.getAuthor() != webPage.getAuthor() ||
          curWebPage.getId() == webPage.getId()) {
        continue;
      }

      if (Util.getString(curWebPage.getUrl(), "").equals(webPage.getUrl())) {
        ControllerStatus status = new ControllerStatus();
        status.setProp("ui.webpage.dc.already-exists", curWebPage.getWorkspace().getTitle());
        return status;
      }
    }

    return super.checkIntegrity(data);
  }
}
