package custom;

import generated.PortletQueryForeach;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.log4j.NDC;
import org.apache.oro.text.regex.MalformedPatternException;
import org.apache.oro.text.regex.MatchResult;
import org.apache.oro.text.regex.Pattern;
import org.apache.oro.text.regex.Perl5Compiler;

import com.jalios.jcms.Category;
import com.jalios.jcms.Channel;
import com.jalios.jcms.Publication;
import com.jalios.jcms.policy.BasicWizardPolicyFilter;
import com.jalios.jcms.portlet.PortalElement;
import com.jalios.jcms.portlet.PortalRedirect;
import com.jalios.jcms.workspace.WizardContext;
import com.jalios.jcms.workspace.WorkspaceWizardContext;
import com.jalios.util.RegexpSubstitution;
import com.jalios.util.Util;

public class CustomWizardPolicyFilter extends BasicWizardPolicyFilter {

	private static final Logger logger = Logger.getLogger(CustomWizardPolicyFilter.class);

	// Compile Cids Patterns
	protected static Pattern cidsPattern;
	protected static Perl5Compiler cidsPatternCompiler = new Perl5Compiler();
	static {
		try {
			cidsPattern = cidsPatternCompiler.compile("cids=([a-zA-Z0-9_]+)");
		} catch (MalformedPatternException ex) {
			ex.printStackTrace();
			logger.warn("An exception occured while compiling wiki perl5 pattern", ex);
		}
	}

	// ------------------------------------------------------------------------
	// IMPLEMENTS
	// ------------------------------------------------------------------------

	@Override
  public void afterWizard(WizardContext ctx) {

		// Skip other context
		if (!(ctx instanceof WorkspaceWizardContext)) {
			return;
		}

		WorkspaceWizardContext ctxt = (WorkspaceWizardContext) ctx;

		NDC.push("[CustomWizardPolicyFilter]");
		try {

			Map pubMap = new HashMap(ctxt.getPublicationMap());
			for (Iterator it = pubMap.values().iterator(); it.hasNext();) {
				Publication itPub = (Publication) it.next();

				if (!(itPub instanceof PortalRedirect || itPub instanceof PortletQueryForeach)) {
					continue;
				}

				Publication itCopy = itPub.getClass().getConstructor(new Class[] { itPub.getClass() }).newInstance(new Object[] { itPub });
				boolean update = false;

				if (itPub instanceof PortalRedirect) {
					update = bindPortalRedirect((PortalRedirect) itPub, (PortalRedirect) itCopy, ctxt);
				} else if (itPub instanceof PortletQueryForeach) {
					update = bindPortletQueryForeach((PortletQueryForeach) itPub, (PortletQueryForeach) itCopy, ctxt);
				} 

				if (!update) {
					continue;
				}

				if (itCopy.checkUpdate(ctxt.getAuthor(), ctxt.getDataControllerContext()).isOK()) {
					itCopy.performUpdate(ctxt.getAuthor(), ctxt.getDataControllerContext());
				}
			}
		} catch (Exception ex) {
			logger.warn(ex.getMessage(), ex);
		} finally {
			NDC.pop();
		}
	}

	// ------------------------------------------------------------------------
	// PROTECTED
	// ------------------------------------------------------------------------

	protected boolean bindPortalRedirect(PortalRedirect portlet, PortalRedirect copy, WorkspaceWizardContext ctxt) throws Exception {
		Category cat = Channel.getChannel().getCategory(portlet.getCategory());
		boolean update = false;

		// Fix redirect categories
		Category copyCat = (Category) ctxt.getCategoryMap().get(cat);
		if (copyCat != null) {
			copy.setCategory(copyCat.getId());
			update = true;
		}

		// Fix redirect Portlet
		PortalElement redirect = portlet.getRedirectPortlet();
		PortalElement copyRedirect = getDuplicate(redirect, ctxt);

		if (copyRedirect == null) {
			return update;
		}

		copy.setRedirectPortlet(copyRedirect);
		return true;
	}

	protected boolean bindPortletQueryForeach(PortletQueryForeach portlet, PortletQueryForeach copy, WorkspaceWizardContext ctxt) {

		String[] queries = portlet.getQueries();
		if (Util.isEmpty(queries)) {
			return false;
		}

		boolean update = false;
		String[] queries2 = new String[queries.length];
		for (int i = 0; i < queries.length; i++) {
			queries2[i] = Util.replace(queries[i], cidsPattern, new CidsSubstitution(ctxt));
			if (queries[i] != null && !queries[i].equals(queries2[i])) {
				update = true;
			}
		}

		copy.setQueries(queries2);
		return update;
	}

	// ------------------------------------------------------------------------
	// PRIVATE
	// ------------------------------------------------------------------------

	private PortalElement getDuplicate(PortalElement child, WorkspaceWizardContext ctxt) {

		if (child == null) {
			return null;
		}

		PortalElement copyChild = (PortalElement) ctxt.getPublicationMap().get(child);
		if (copyChild != null) {
			return copyChild;
		} else if (child.getWorkspace() == ctxt.getWSModel()) {
			copyChild = child.duplicate(ctxt, true);
			return copyChild;
		}

		return null;
	}

	/*
	 * A sample getting started code to update a kind of fields
	 * 
	 * private PortalElement getDuplicate(PortalElement portlet,
	 * WorkspaceWizardContext ctxt){
	 * 
	 * if (portlet == null){ return null; }
	 * 
	 * TypeFieldEntry[] entries = portlet.getTypeFieldsEntries(); for (int i =
	 * 0; i < entries.length; i++) { TypeFieldEntry tfe = entries[i]; if
	 * (!"query".equals(tfe.getEditor())) { continue; }
	 * 
	 * Object value = portlet.getFieldValue(tfe.getName());
	 * 
	 * Object copy = // Call a method to update object if (copy == null){
	 * continue; }
	 * 
	 * // Call reflexivity to update field // portlet.set{Field}(tfe.set
	 * getName(),copy); } }
	 */

	// ------------------------------------------------------------------------
	// STATIC INNER CLASS
	// ------------------------------------------------------------------------

	public static class CidsSubstitution implements RegexpSubstitution {

		protected WorkspaceWizardContext ctxt = null;
		protected Channel channel = null;

		public CidsSubstitution(WorkspaceWizardContext ctxt) {
			this.ctxt = ctxt;
			this.channel = Channel.getChannel();
		}

		public String substitute(MatchResult results) {
			if (ctxt == null) {
				return "";
			}

			String id = results.group(1);

			Category cat = channel.getCategory(id);
			if (cat == null) {
				return "cids=" + id;
			}

			Category copy = (Category) ctxt.getCategoryMap().get(cat);
			if (copy == null || copy == cat) {
				return "cids=" + id;
			}

			return "cids=" + copy.getId();
		}
	}

}
