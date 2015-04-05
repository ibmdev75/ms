package custom;

import java.io.File;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;

import com.jalios.jcms.Channel;
import com.jalios.jcms.ControllerStatus;
import com.jalios.jcms.JcmsUtil;
import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.WorkflowConstants;
import com.jalios.jcms.portlet.PortalElement;
import com.jalios.util.Util;

public class CustomArchiveManager {
  public static Channel channel = Channel.getChannel();

  /**
   * This method is called by Publication.canBeArchived
   * It checks if the publication can be archived by the given member
   * 
   * @param pub the publication to check
   * @param mbr the member to check
   * @param context a map which contains context parameters (may be null), same map used in checkUpdate/performUpdate
   * @return true if the publication can be archived
   * @since jcms-4.1.1
   */
  public static ControllerStatus canBeArchived(Publication pub, Member mbr, Map context) {
    // Fix bug JCMS-2578 : Do not check for authorization during performUpdate
    boolean checkAuthorization = !Util.toBoolean(context.get("archive.skip-authorization-chek"), false);

    if (checkAuthorization && mbr == null) {
      ControllerStatus errorStatus = new ControllerStatus(Publication.CTRL_TOPIC_WORKFLOW);
      errorStatus.setProp("msg.edit.arch.cannot-be-archived");
      errorStatus.addNestedStatus(new ControllerStatus("User must be logged to archive")); // I18N
      return errorStatus;
    }

    // Do not allow any descendant of a tree node to be archived
    if (pub.getTreeParent() != null) {
      ControllerStatus errorStatus = new ControllerStatus(Publication.CTRL_TOPIC_WORKFLOW);
      errorStatus.setProp("msg.edit.arch.cannot-be-archived");
      errorStatus.addNestedStatus(new ControllerStatus("Publication (TreeNode) still has tree parent:" + pub.getTreeParent())); // I18N
      return errorStatus;
    }
    // Do not allow archival of Portlet
    if (pub instanceof PortalElement) {
      ControllerStatus errorStatus = new ControllerStatus(Publication.CTRL_TOPIC_WORKFLOW);
      errorStatus.setProp("msg.edit.arch.cannot-be-archived");
      errorStatus.addNestedStatus(new ControllerStatus("Portlet cannot be archived")); // I18N
      return errorStatus;
    }

    if (pub.isUserContent()) {
      ControllerStatus errorStatus = new ControllerStatus(Publication.CTRL_TOPIC_WORKFLOW);
      errorStatus.setProp("msg.edit.arch.cannot-be-archived");
      errorStatus.addNestedStatus(new ControllerStatus("UserContent cannot be archived")); // I18N
      return errorStatus;
    }

    // Fix bug JCMS-2204 : Archive fails if there is too many authorized groups or members
    String authorizedGroupIds = JcmsUtil.dataListToString(pub.getAuthorizedGroupSet(), " ");
    if (authorizedGroupIds != null && authorizedGroupIds.length() >= 256) { // 256 is the maxlength of a varchar as specified in ArchivedPublication.hbm.xml
      ControllerStatus errorStatus = new ControllerStatus(Publication.CTRL_TOPIC_WORKFLOW);
      errorStatus.setProp("msg.edit.arch.cannot-be-archived");
      errorStatus.addNestedStatus(new ControllerStatus("Publication cannot be archived : too many authorized groups")); // I18N
      return errorStatus;
    }
    String authorizedMemberIds = JcmsUtil.dataListToString(pub.getAuthorizedMemberSet(), " ");
    if (authorizedMemberIds != null && authorizedMemberIds.length() >= 256) { // 256 is the maxlength of a varchar as specified in ArchivedPublication.hbm.xml
      ControllerStatus errorStatus = new ControllerStatus(Publication.CTRL_TOPIC_WORKFLOW);
      errorStatus.setProp("msg.edit.arch.cannot-be-archived");
      errorStatus.addNestedStatus(new ControllerStatus("Publication cannot be archived : too many authorized members")); // I18N
      return errorStatus;
    }

    if (!checkAuthorization){
      return ControllerStatus.OK;
    }
    
    if (mbr.isAdmin()) {
      return ControllerStatus.OK;
    }

    Publication original = channel.getPublication(pub.getId());
    // Check there is a valid transition to ARCHIVED pstatus from the current pstatus, for the workflow of this publication
    if (original != null && original.getPstatus() != WorkflowConstants.ARCHIVED_PSTATUS) {
      Object[]results = original.checkStateChange(mbr, WorkflowConstants.ARCHIVED_PSTATUS, original.getPstatus());
      boolean canChangeToArchiveState = ((Boolean) results[0]).booleanValue();
      if (!canChangeToArchiveState) {
        ControllerStatus errorStatus = new ControllerStatus(Publication.CTRL_TOPIC_WORKFLOW);
        errorStatus.setProp("msg.edit.arch.cannot-be-archived");
        errorStatus.addNestedStatus(new ControllerStatus("Missing transition to Archived pstatus from current pstatus " + original.getPstatus())); // I18N
        return errorStatus;
      }
    }

    // Check the mbr can delete this pub
    // Fix bug JCMS-3103 : Check delete authorization on both original and update publication
    ControllerStatus deleteStatus = pub.checkDelete(mbr, context);
    ControllerStatus deleteOriginalstatus = original != null ? original.checkDelete(mbr, context) : null;
    if (deleteStatus.hasFailed() && (deleteOriginalstatus == null || deleteOriginalstatus.hasFailed())) {
      ControllerStatus errorStatus = new ControllerStatus(Publication.CTRL_TOPIC_WORKFLOW);
      errorStatus.setProp("msg.edit.arch.cannot-be-archived");
      if (deleteStatus.hasFailed()) { errorStatus.addNestedStatus(deleteStatus);}
      if (deleteOriginalstatus != null && deleteOriginalstatus.hasFailed()) { errorStatus.addNestedStatus(deleteOriginalstatus); }
      return errorStatus;
    }

    return ControllerStatus.OK;
  }

  /**
   * This method is called by ArchiveManager.archivePublication
   * It allow any hook to be done before the publication is archived
   * 
   * @param pub the publication to be archived
   * @since jcms-4.1.1
   */
  public static void performBeforeArchiving(Publication pub) {

  }

  /**
   * This method is called by ArchiveManager when copying file associated with a
   * publication being archived.
   * It checks if the given file can be archived and thus copied to the
   * publication's archive directory.
   * 
   * @param file the file to check
   * @param pub the publication of which the given the file is taken
   * @return true if the file can be archived
   * @since jcms-4.1.1
   */
  public static boolean canFileBeArchived(File file, Publication pub) {
    // Example:
    // if (file size too large) or (file is mp3)
    // return false

    return true;
  }

  /**
   * This method is called by LuceneArchiveEngine.indexPublication
   * It should be called by any ArchiveEngine.indexPublication
   * 
   * @param pub the publication from which we want the search texts
   * @return the text to index 
   * @since jcms-4.1.1
   */
  public static String getPublicationSearchText(Publication pub) {
    StringBuffer sb = new StringBuffer();

    // Author Full Name
    sb.append(pub.getAuthor().getFullName());
    sb.append(' ');

    // Publication search strings
    String[] searchString = pub.getSearchStrings();
    for (int i = 0; i < searchString.length; i++) {
      if (searchString[i] != null) {
        sb.append(searchString[i]);
        sb.append(' ');
      }
    }

    // Children Search Text (recursive)
    Collection children = pub.getTreeChildren();
    for (Iterator it = children.iterator(); it.hasNext();) {
      Publication childPub = (Publication) it.next();
      if (childPub != null) {
        sb.append(getPublicationSearchText(childPub));
        sb.append(' ');
      }
    }

    return sb.toString();
  }

  /**
   * This method is called by ArchiveManager.archivePublication
   * It allow any further process to be done before the publication is deleted
   * For example, deletion of any children publication
   * 
   * @param pub the publication to be archived
   * @since jcms-4.1.1
   */
  public static void performBeforeDeletion(Publication pub) {
    // EMPTY
  }

}
