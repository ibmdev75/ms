package custom;

//import org.apache.log4j.Logger;

import com.jalios.jcms.AudienceRights;
import com.jalios.jcms.AudiencedPublication;
import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;


public class RightPolicy {
//  private static final Logger logger = Logger.getLogger(RightPolicy.class);

  /**
   * Check if the given publication is Audienced. <br>
   * This methods is directly called by {@link Publication#isAudienced()}. <br>
   * Default implementation is to return true if the Publication implements
   * the AudiencedPublication interface.
   * @param pub the publication to check
   * @return true if the given publication is Audienced.
   * @since jcms-5.7.0
   */
  public static boolean isAudienced(Publication pub) {
    // If you need to replace this and implement your own computation to determine
    // if a publication is audienced or not, you SHOULD cache any results of heavy
    // computations.
    // To cache any information in a publication, you could use a StoreListener to
    // do the computation and store the result in the extra info for reuse here.
    // In a StoreListener:
    //   pub.setExtraInfo("EI.isAudienced", Boolean.valueOf(resultOfMyComputation));
    // Here:
    //   return Util.toBoolean(pub.getExtraInfo("EI.isAudienced"), false);
    return pub instanceof AudiencedPublication;
  }
  
  
  /**
   * Check audience rights of a publication when AudienceRights is enabled.
   * @param isAuthorized true if internal JCMS control authorized the member to perform this action
   * @param pub the publication to check
   * @param mbr the member to check
   * @param searchInGroups if true check if one of the group this
   * member belongs to is authorized to read this publication.
   * @return true if the member can read this publication
   * @since jcms-5.7.0
   */
  public static boolean checkAudienceRights(boolean isAuthorized, Publication pub, Member mbr, boolean searchInGroups) {

    // Audienced publication are only for logged members
    if (mbr == null) {
      return false;
    }
    // Workspace Admin (or Admin)
    if (pub.getWorkspace().isAdmin(mbr)){
      return true;
    }
    // Author
    if (mbr == pub.getAuthor()) {
      return true;
    }
    
    //                  | A. AudienceRights OK  | B. AudienceRights KO  |
    // No ReadRights  1 |         OK            |         KO            |
    // ReadRights OK  2 |        +OK*           |        +OK*           |
    // ReadRights KO  3 |        +OK            |         KO            |
    //
    // OK ==> authorized
    // KO ==> not authorized
    // *  ==> no need to check audience rights
    
    // No read Rights (A1, B1)
    if (pub.hasNoReadRights()) {
      return AudienceRights.getInstance().checkRights(pub, mbr);
    }
    // OR between previoulsy computed read rights and
    // Audience rights (A2, B2, A3, B3)
    return isAuthorized || AudienceRights.getInstance().checkRights(pub, mbr);
  }
  
}

  
