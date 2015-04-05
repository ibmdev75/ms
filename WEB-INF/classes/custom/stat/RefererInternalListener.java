package custom.stat;

/** 
 * @author      Jean-Philippe Encausse
 * @since       jcms-5.0.0
 */
public class RefererInternalListener extends RefererListener {
 
  public RefererInternalListener(){
    this(ALL_AREA, "Entry");
  }
  
  public RefererInternalListener(String zone , String mapKey){
    super(zone, mapKey, REFERER_INTERNAL);
  }
}