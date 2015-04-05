package custom;

import com.jalios.jcms.Channel;
import com.jalios.jcms.ChannelListener;
import com.jalios.jcms.DataController;
import com.jalios.jcms.QueryFilter;
import com.jalios.jcms.authentication.AuthenticationHandler;

/**
 * This class provides LEGACY entry points for initialization of custom JCMS hooks.<br>
 * You SHOULD NOT be using this class anymore and instead developp JCMS plugins.<br>
 * 
 * See http://support.jalios.com/howto/plugins
 * for more informations on how to developp JCMS plugins.
 * 
 */
public class JcmsInit {
//  private static final Logger logger = Logger.getLogger(JcmsInit.class);

  /**
   * This method is used by ChannelInitServlet when JCMS is
   * starting. It is called just before the store has been loaded.
   *
   * If for any reason you want to interrupt JCMS startup, you can throw an
   * exception. The exception's message will be displayed in JCMS status page (to any user!).
   * 
   * DEPRECATED : Developp your plugin and use a {@link ChannelListener} to implement initBeforeStoreLoad().
   * 
   * @since jcms-4.1
   * @throws Exception any exception you may want to throw if a problem occurs needing to interrupt JCMS startup.
   */
  public static void initBeforeStoreLoad() throws Exception {
    
    // Add your custom code here
    
    /*
      // Example of StoreListener
      StoreListener sl = new StoreListener() {
        public void handleCreate(Storable storable, boolean firstTime) {
          logger.debug("++++ Create : " + storable.getId());
        }
        public void handleDelete(Storable storable, boolean firstTime) {
          logger.debug("---- Delete : " + storable.getId());
        }
        public void handlePrepareUpdate(Storable storable, Map attributes, boolean firstTime) {}
        public void handleCommitUpdate(Storable storable, Storable oldStorable, boolean firstTime) {}
      };
      
      channel.addStoreListener(sl, com.jalios.jcms.Publication.class, false);
    */

  }
  
  /**
   * This method is used by ChannelInitServlet when JCMS is
   * starting. It is called just after the store has been loaded and
   * the channel has been initialized.
   * 
   * If for any reason you want to interrupt JCMS startup, you can throw an
   * exception. The exception's message will be displayed in JCMS status page (to any user!).
   * 
   * DEPRECATED : Developp your plugin and use a {@link ChannelListener} to implement initAfterStoreLoad().
   *
   * @since jcms-4.1
   * @throws Exception any exception you may want to throw if a problem occurs needing to interrupt JCMS startup.
   */
  public static void initAfterStoreLoad() throws Exception {
    initDataController();
    initQueryFilter();
    initAuthenticationHandler();
  }

  /**
   * Add your custom DataController in this method
   *
   * DEPRECATED : Developp your plugin and with a {@link DataController} plugin component.

   * @since jcms-5.0.0
   * @throws Exception if the initialization of data controllers could not be performed
   *         and that JCMS start should be interrupted
   */
  public static void initDataController() throws Exception {
    Channel channel = Channel.getChannel();
    
    channel.addDataController(new SignUpController(), channel.getClass("generated.SignUp"));
    channel.addDataController(new WebPageController(), channel.getClass("generated.WebPage"));
  }
  
  /**
   * Add your custom QueryFilter in this method
   *
   * DEPRECATED : Developp your plugin and with a {@link QueryFilter} plugin component.

   * @since jcms-5.0.0
   * @throws Exception if the initialization of query filters could not be performed
   *         and that JCMS start should be interrupted
   */
  public static void initQueryFilter() throws Exception {
    //Channel channel = Channel.getChannel();

    //channel.addQueryFilter(new CustomQueryFilter());
    
  }
  /**
   * Add your custom AuthenticationHandler in this method
   *
   * DEPRECATED : Developp your plugin and with a {@link AuthenticationHandler} plugin component.
   * 
   * @since jcms-5.7.0
   * @throws Exception if the initialization of authentication handlers could not be performed
   *         and that JCMS start should be interrupted
   */
  public static void initAuthenticationHandler() throws Exception {
    Channel channel = Channel.getChannel();
    
    channel.addAuthenticationHandler(LdapAuthenticationHandler.getInstance());
  }

}
