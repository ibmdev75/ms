package custom;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import org.apache.log4j.Logger;
import org.apache.log4j.NDC;

import com.jalios.jcms.Category;
import com.jalios.jcms.ControllerStatus;
import com.jalios.jcms.Data;
import com.jalios.jcms.Group;
import com.jalios.jcms.JcmsConstants;
import com.jalios.jcms.Member;
import com.jalios.jcms.authentication.AuthenticationContext;
import com.jalios.jcms.authentication.AuthenticationHandler;
import com.jalios.jcms.ldap.LdapManager;
import com.jalios.jcms.ldap.SyncLdapHandler;
import com.jalios.ldap.LDAPConfiguration;
import com.jalios.ldap.LDAPMapper;
import com.jalios.ldap.LDAPUtil;
import com.jalios.util.PasswordGenerator;
import com.jalios.util.Util;
import com.unboundid.ldap.sdk.LDAPException;
import com.unboundid.ldap.sdk.SearchResultEntry;


/**
 * Authenticate and synchronize users using LDAP.<br>
 * <br>
 * These two methods are used internally by JCMS,
 * DO NOT modify their signature :
 * <ul>
 *  <li>{@link #synchronizeAccount(LDAPMapper, String, String, Member, boolean, boolean)}</li>
 *  <li>{@link #synchronizeGroup(LDAPMapper, Group, Member)}</li>
 * </ul>
 */
public class LdapAuthenticationHandler extends AuthenticationHandler {

  private static final Logger logger = Logger.getLogger(LdapAuthenticationHandler.class); 
  private static final LdapManager ldapMgr = LdapManager.getInstance();
  private static final Boolean memberCreationLock = new Boolean(true);

  // User fields mapping properties
  public static String USER_LOGIN_ATTR;        // uid, sAMAccountName
  public static String USER_LASTNAME_ATTR;     // sn
  public static String USER_FIRSTNAME_ATTR;    // givenName
  public static String USER_SALUTATION_ATTR;   //
  public static String USER_ORGANIZATION_ATTR; // organization
  public static String USER_DEPARTMENT_ATTR;   // department
  public static String USER_JOBTITLE_ATTR;     // title
  public static String USER_EMAIL_ATTR;        // mail
  public static String USER_PHONE_ATTR;        // telephoneNumber
  public static String USER_MOBILE_ATTR;       // mobile
  public static String USER_STREET_ATTR;       // street / streetAddress
  public static String USER_POSTAL_CODE_ATTR;  // postalCode
  public static String USER_PO_BOX_ATTR;       // postOfficeBox
  public static String USER_LOCALITY_ATTR;     // l / localityName
  public static String USER_REGION_ATTR;       // st / stateOrProvinceName
  public static String USER_COUNTRY_ATTR;      // c / countryCode
  public static String USER_ADDRESS_ATTR;      // postalAddress (legacy)
  public static String USER_INFO_ATTR;         // description
  
  // Group fields mapping properties
  public static String GROUP_NAME_ATTR;      // cn
  public static String GROUP_MEMBER_ATTR;    // memberUid, member

  // List of attributes retrieved in users LDAP Entry
  public static String[] USER_ATTRIBUTES;
  // List of attributes retrieved in groups LDAP Entry
  public static String[] GROUP_ATTRIBUTES;

  //-----------------------------------------------
  // Singleton 
  //-----------------------------------------------

  private static final LdapAuthenticationHandler singleton = new LdapAuthenticationHandler();
  public static final LdapAuthenticationHandler getInstance() {
    return singleton;
  }
  private LdapAuthenticationHandler() { loadProperties(); }

  // ------------------------------------------------------------------------------
  // AuthenticationHandler implementation
  // ------------------------------------------------------------------------------

  /**
   * Method called each time JCMS properties are saved/reloaded.
   */  
  @Override
  public void loadProperties() {
    USER_LOGIN_ATTR        = channel.getProperty("ldap.mapping.login");         // uid, sAMAccountName
    USER_LASTNAME_ATTR     = channel.getProperty("ldap.mapping.name");          // sn
    USER_FIRSTNAME_ATTR    = channel.getProperty("ldap.mapping.f-name");        // givenName
    USER_SALUTATION_ATTR   = channel.getProperty("ldap.mapping.salut");         //
    USER_ORGANIZATION_ATTR = channel.getProperty("ldap.mapping.organization");  // organizationName
    USER_DEPARTMENT_ATTR   = channel.getProperty("ldap.mapping.department");    // department
    USER_JOBTITLE_ATTR     = channel.getProperty("ldap.mapping.job");           // title
    USER_EMAIL_ATTR        = channel.getProperty("ldap.mapping.mail");          // mail
    USER_PHONE_ATTR        = channel.getProperty("ldap.mapping.phone");         // telephoneNumber
    USER_MOBILE_ATTR       = channel.getProperty("ldap.mapping.mobile");        // mobile
    USER_STREET_ATTR       = channel.getProperty("ldap.mapping.street");        // street / streetAddress
    USER_POSTAL_CODE_ATTR  = channel.getProperty("ldap.mapping.postalCode");    // postalCode
    USER_PO_BOX_ATTR       = channel.getProperty("ldap.mapping.postOfficeBox"); // postOfficeBox
    USER_LOCALITY_ATTR     = channel.getProperty("ldap.mapping.locality");      // l / localityName
    USER_REGION_ATTR       = channel.getProperty("ldap.mapping.region");        // st / stateOrProvinceName
    USER_COUNTRY_ATTR      = channel.getProperty("ldap.mapping.country");       // c / countryCode
    USER_ADDRESS_ATTR      = channel.getProperty("ldap.mapping.address");       // postalAddress (legacy)
    USER_INFO_ATTR         = channel.getProperty("ldap.mapping.info");          // description
    
    GROUP_NAME_ATTR    = channel.getProperty("ldap.grp-mapping.name");          // cn
    GROUP_MEMBER_ATTR  = channel.getProperty("ldap.grp-mapping.member");        // memberUid, member

    USER_ATTRIBUTES = new String[] {
        LDAPUtil.OBJECT_CLASS_ATTR,
        USER_LOGIN_ATTR,      USER_LASTNAME_ATTR,     USER_FIRSTNAME_ATTR,
        USER_SALUTATION_ATTR, USER_ORGANIZATION_ATTR, USER_DEPARTMENT_ATTR, USER_JOBTITLE_ATTR,
        USER_EMAIL_ATTR,      USER_PHONE_ATTR,        USER_MOBILE_ATTR,  
        USER_STREET_ATTR, USER_POSTAL_CODE_ATTR, USER_PO_BOX_ATTR,
        USER_LOCALITY_ATTR, USER_REGION_ATTR, USER_COUNTRY_ATTR,
        USER_ADDRESS_ATTR,    USER_INFO_ATTR
    };
    GROUP_ATTRIBUTES = new String[] {
        LDAPUtil.OBJECT_CLASS_ATTR,
        GROUP_NAME_ATTR, GROUP_MEMBER_ATTR
    };
  }
  
  //-----------------------------------------------
  // AuthenticationHandler implementation 
  //-----------------------------------------------

  @Override
  public void login(AuthenticationContext ctxt) throws IOException {
    // the ldap authentication handler only works when credential are provided
    // (form submit or login/password available) and of course when ldap is enabled
    if (!ctxt.isCredentialProvided() || !ldapMgr.isLdapEnabled()) {
      ctxt.doChain();
      return;
    }
    
    // Skip existing member completely detached from LDAP (Improvement JCMS-3313)
    Member memberFromLogin = channel.getMemberFromLogin(ctxt.getLogin());
    if (memberFromLogin != null && !memberFromLogin.getLdapSync() && !memberFromLogin.isLdapAccount()) {
      ctxt.doChain();
      return;
    }
    
    // 1. Authenticate using LDAP
    LDAPConfiguration ldapConf = ldapMgr.getLDAPConfigurationFromLogin(ctxt.getLogin());
    LDAPMapper mapper = new LDAPMapper(ldapConf);
    boolean ldapAdminConnectionFailed = false;
    final Member member;    
    if (!mapper.isConnected()) {
      logger.warn("Could not connect to LDAP", mapper.getLastException());
      ldapAdminConnectionFailed = true;
      member = null;
    } else {
      // Search LDAP user, authenticate and synchronize
      member = synchronizeAccount(mapper, ctxt.getLogin(), ctxt.getPassword(), channel.getDefaultAdmin(),
                                  true, ldapConf.getSynchronize());
      mapper.disconnect();
    }
    
    // 2. Authentication Success
    if (member != null && member.isValidAccount()) {
      logger.debug("Authentication processed using LDAP");
      ctxt.setLoggedMember(member);
    }
    
    // 3. Authentication Failed
    if (ldapAdminConnectionFailed) {
      ctxt.setWarningMsg("msg.login.ldap-error");
    }
    if (mapper.getLastException() != null) {
      // Should you need to provide a detailed explanation of the connection 
      // failure to your users, customize login jsp and use this exception.
      ctxt.getRequest().setAttribute("ldapException", mapper.getLastException());
    }
    
    ctxt.doChain();
  }

  // ------------------------------------------------------------------------------
  // Account ang Group synchronization Method
  // !!! used internally by JCMS, do not change methods signatures
  // ------------------------------------------------------------------------------
  
  /**
   * This methods performs member LDAP authentication and/or member account
   * synchronization (creation/update) with LDAP fields.
   * 
   * It is called by :
   * - LdapAuthenticationManager#login(....) to authenticate AND synchronize
   *   member during their connexion to the site.
   * - Internal methods of JCMS to synchronize member when requested by
   *   administrators (through caddy, members list).
   *
   * <b>You MUST not change the signature of this method as it called
   * internally by JCMS.</b>
   * 
   * <p>
   * This method will automatically disable any existing Member with the
   * specified login if the corresponding LDAP user could not be found.
   * 
   * @param mapper         the configured LDAPMapper
   * @param login          the typed/entered login
   * @param password       the typed/entered password
   * @param opAuthor       the author of the operation (may be null)
   * @param authenticate   indicate if we should authenticate the given login/pass to the ldap
   * @param synchronize    indicate if we should synchronize the member with the ldap
   * @return a Member instance (existing or new) if the LDAP user could be found, synchronized and authenticated (if requested)<br/>
   *         return null if the LDAP user could not be found in the LDAP or could not be authenticated (if it was requested).
   * @since jcms-4.0
   */
  public static Member synchronizeAccount(LDAPMapper mapper, String login, String password,
      Member opAuthor, boolean authenticate, boolean synchronize) {
    
    // STEP 1: Retrieve user entry in LDAP
    String ldapEntryLogin = login;
    // Extract the sAMAccountName from the login (for "DOMAIN\login" format only)
    boolean extractSAMAccountNameFromLogin = channel.getBooleanProperty("ldap.extract-sAMAccountName-from-login", true);
    if (extractSAMAccountNameFromLogin) {
      ldapEntryLogin = LDAPUtil.extractSAMAccountName(ldapEntryLogin);
    }
    // Retrieve LDAP Entry
    SearchResultEntry entry = mapper.getUserLDAPEntry(ldapEntryLogin, USER_ATTRIBUTES);
    if (entry == null) {
      // Automatically disable existing LDAP Member which cannot be find anymore in LDAP
      // Known limit (related to behavior introduced by bug fix JCMS-3981) : 
      //  Member will be disabled only if the exact same login sync'ed with the LDAP was specified by the user
      //  e.g : member was synchronized with Member.login == LDAPEntry.mail == "johnsmith@example.com" 
      //    - if user tries to log in with "johnsmith", Member will not be found, therefore not disabled
      //    - if user tries to log in with "EXAMPLE\johnsmith", Member will not be found, therefore not disabled
      //    - if user tries to log in with "johnsmith@example.com", Member will be found, therefore correctly disabled
      Member member = channel.getMemberFromLogin(login);
      if (member != null && member.isLdapAccount() && !member.isDisabled()) {
        Member updated = (Member) member.getUpdateInstance();
        updated.disable();
        updated.performUpdate(opAuthor); 
      }
      return null;
    }
    
    // STEP 2: Authenticate LDAP user using its dn and credential
    if (authenticate && !mapper.authenticate(entry.getDN(), password)) {
      return null;
    }

    // STEP 3: Synchronize LDAP user, Update/Create the Member
    return updateOrCreateAccount(mapper, entry, login, opAuthor);
  }
  
  /**
   * Synchronize given LDAP group, retrieve all its members from LDAP and create them.
   * 
   * <b>You MUST not change the signature of this method as it called
   * internally by JCMS.</b>

   * @param mapper     the LDAPMapper used to communicate with the LDAP
   * @param group      the Group (with a required DN) to import.
   * @param opAuthor   the author of the operation (may be null)
   * @throws LDAPException if group entry could not be retrieved from LDAP
   * @since jcms-5.7
   */
  public static void synchronizeGroup(LDAPMapper mapper, Group group, Member opAuthor) throws LDAPException {

    String groupDN = group.getLdapDN();
    if (Util.isEmpty(groupDN)) {
      return;
    }
    SearchResultEntry groupEntry = mapper.getLDAPConnection().getEntry(groupDN, GROUP_ATTRIBUTES);
    updateOrCreateGroups(mapper, groupEntry, true, opAuthor, null, null);
  }

  // ------------------------------------------------------------------------------
  // LDAP Synchronization methods
  // ------------------------------------------------------------------------------
  
  /**
   * This methods use the given user's LDAP Entry to create/update the
   * corresponding member in JCMS.
   * @param mapper     the LDAPMapper used to communicate with the LDAP
   * @param userEntry  the user SearchResultEntry to to import.
   * @param login      the login to use for the member (may be null)
   * @param opAuthor   the author of the operation (may be null)
   * @return the JCMS Member that corresponding to the LDAP user Entry.
   */
  public static Member updateOrCreateAccount(LDAPMapper mapper, SearchResultEntry userEntry,
                                           String login, Member opAuthor) {
    if (logger.isDebugEnabled()) {
      logger.debug("updateOrCreateAccount [userEntryDN: '" + userEntry.getDN() + "', login='" + login +"']");
    }
    
    Member member;
    synchronized(memberCreationLock) { // prevent creation of two user with same login

      // Fix bug JCMS-3981 : Duplicate Member accounts created by LDAP synchronization when using different login
      // Make sure we always use the login from the ldap for member synchronisation
      login = LDAPUtil.getString(userEntry.getAttribute(USER_LOGIN_ATTR), login); 
      if (Util.isEmpty(login)) {
        logger.warn("Cannot synchronize LDAP account '"+userEntry.getDN()+"' without a valid login.");
        return null;
      }
      
      // Retrieve existing member if any
      member = channel.getMemberFromLogin(login);
      
      boolean synchronizeMember = mapper.getLDAPConfiguration().getSynchronize();
      if (!synchronizeMember || !channel.isDataWriteEnabled()) {
        return member;
      }

      // 1. Retrieve Member's groups, 
      //         existing groups if any and LDAP groups (create or update them as needed)
      boolean synchronizeGroups = synchronizeMember && mapper.getLDAPConfiguration().getSynchronizeGroups();
      Group[] groups = synchronizeGroups ? getAccountGroups(mapper, userEntry, member, opAuthor) : null;

      // Determine which LDAP fields have been properly configured in the mapping,
      // and only synchronize those fields
      // This is required for fix JCMS-3120 : emptied fields are not taken into account when updating a Member
      // We want to clear member's field if they have been cleared in the LDAP, 
      // but we do not want the field which are not mapped to be erased just because no
      // value was retrieved
      boolean syncName         = Util.notEmpty(USER_LASTNAME_ATTR);  
      boolean syncFirstName    = Util.notEmpty(USER_FIRSTNAME_ATTR); 
      boolean syncSalutation   = Util.notEmpty(USER_SALUTATION_ATTR); 
      boolean syncOrganization = Util.notEmpty(USER_ORGANIZATION_ATTR); 
      boolean syncdepartment   = Util.notEmpty(USER_DEPARTMENT_ATTR); 
      boolean syncJobTitle     = Util.notEmpty(USER_JOBTITLE_ATTR); 
      boolean syncEmail        = Util.notEmpty(USER_EMAIL_ATTR);
      boolean syncPhone        = Util.notEmpty(USER_PHONE_ATTR);
      boolean syncMobile       = Util.notEmpty(USER_MOBILE_ATTR);
      boolean syncStreet       = Util.notEmpty(USER_STREET_ATTR);
      boolean syncPostalCode   = Util.notEmpty(USER_POSTAL_CODE_ATTR);
      boolean syncPoBox        = Util.notEmpty(USER_PO_BOX_ATTR);
      boolean syncLocality     = Util.notEmpty(USER_LOCALITY_ATTR);
      boolean syncRegion       = Util.notEmpty(USER_REGION_ATTR);
      boolean syncCountry      = Util.notEmpty(USER_COUNTRY_ATTR);
      boolean syncAddress      = Util.notEmpty(USER_ADDRESS_ATTR);
      boolean syncInfo         = Util.notEmpty(USER_INFO_ATTR);  
      
      // 2. Read LDAP fields    
      String name         = LDAPUtil.getString(userEntry.getAttribute(USER_LASTNAME_ATTR), "");  
      String firstName    = LDAPUtil.getString(userEntry.getAttribute(USER_FIRSTNAME_ATTR) , ""); 
      String salutation   = LDAPUtil.getString(userEntry.getAttribute(USER_SALUTATION_ATTR) , ""); 
      String organization = LDAPUtil.getString(userEntry.getAttribute(USER_ORGANIZATION_ATTR) , ""); 
      String department   = LDAPUtil.getString(userEntry.getAttribute(USER_DEPARTMENT_ATTR) , ""); 
      String jobTitle     = LDAPUtil.getString(userEntry.getAttribute(USER_JOBTITLE_ATTR) , ""); 
      String email        = LDAPUtil.getString(userEntry.getAttribute(USER_EMAIL_ATTR) , "");
      String phone        = LDAPUtil.getString(userEntry.getAttribute(USER_PHONE_ATTR) , "");
      String mobile       = LDAPUtil.getString(userEntry.getAttribute(USER_MOBILE_ATTR) , "");
      String street       = LDAPUtil.getString(userEntry.getAttribute(USER_STREET_ATTR) , "");
      String postalCode   = LDAPUtil.getString(userEntry.getAttribute(USER_POSTAL_CODE_ATTR) , "");
      String poBox        = LDAPUtil.getString(userEntry.getAttribute(USER_PO_BOX_ATTR) , "");
      String locality     = LDAPUtil.getString(userEntry.getAttribute(USER_LOCALITY_ATTR) , "");
      String region       = LDAPUtil.getString(userEntry.getAttribute(USER_REGION_ATTR) , "");
      String country      = LDAPUtil.getString(userEntry.getAttribute(USER_COUNTRY_ATTR) , "");
      String address      = LDAPUtil.getString(userEntry.getAttribute(USER_ADDRESS_ATTR) , "");
      String info         = LDAPUtil.getString(userEntry.getAttribute(USER_INFO_ATTR) , "");

      // 3. synchronize ldap user

      //  JCMS account does not exist, create it.
      if (member == null) {
        if (logger.isDebugEnabled()) {
          logger.debug("Member [login:'"+ login + "', name:'" + name + "'] does not exists yet, create it...");
        }

        member = new Member();
        member.setLogin(login);
        if (syncName)         { member.setName(name); }
        if (syncFirstName)    { member.setFirstName(firstName); }
        if (syncSalutation)   { member.setSalutation(salutation); }
        if (syncOrganization) { member.setOrganization(organization); }
        if (syncdepartment)   { member.setDepartment(department); }
        if (syncJobTitle)     { member.setJobTitle(jobTitle); }
        if (syncEmail)        { member.setEmail(email); }
        if (syncPhone)        { member.setPhone(phone); }
        if (syncMobile)       { member.setMobile(mobile); }
        if (syncStreet)       { member.setStreet(street); }
        if (syncPostalCode)   { member.setPostalCode(postalCode); }
        if (syncPoBox)        { member.setPoBox(poBox); }
        if (syncLocality)     { member.setLocality(locality); }
        if (syncRegion)       { member.setRegion(region); }
        if (syncCountry)      { member.setCountry(country); }
        if (syncAddress)      { member.setAddress(address); }
        if (syncInfo)         { member.setInfo(info); }

        member.setDeclaredGroups(synchronizeGroups ? groups : new Group[] {channel.getDefaultGroup()} );

        member.setLastLdapSynchro(new Date());
        member.setPassword(PasswordGenerator.generateRandomPassword(8));
        
        ControllerStatus createStatus = member.checkCreate(opAuthor);  
        if (createStatus.hasFailed()) {
          logger.warn("Member [login:'"+ login + "', full name :'" + member.getFullName() + "'] CANNOT be created : " + createStatus.getMessage(channel.getLanguage()));
          return null;
        }
        
        member.performCreate(opAuthor);
        if (logger.isDebugEnabled()) {
          logger.debug("Member '" + member.getFullName() + "' ('"+member.getId()+"') created.");
        }
        SyncLdapHandler.updateLdapGroupSyncProgressInformation(SyncLdapHandler.SYNC_PROGRESS_MEMBER_CREATED, member);
      }

      //  JCMS account exists, update it.
      else {
        
        // Improvement JCMS-2450 : Add an option to each Member to prevent/stop LDAP synchronisation
        if (member.getLdapSync() == false) { 
          if (logger.isDebugEnabled()) {
            logger.debug("Member [login:'"+ login + "', name:'" + name + "'] already exists but its LDAP synchronization has been disabled, skip update...");
          }
          return member;
        }
        
        if (logger.isDebugEnabled()) {
          logger.debug("Member [login:'"+ login + "', name:'" + name + "'] already exists, update it if needed...");
        }
        
        Member updated = (Member) member.getUpdateInstance();

        updated.setLogin(login);
        boolean change = false;
        if (syncName)         { updated.setName(name);                 change = change || !name.equals(member.getName()); }
        if (syncFirstName)    { updated.setFirstName(firstName);       change = change || !firstName.equals(member.getFirstName()); }
        if (syncSalutation)   { updated.setSalutation(salutation);     change = change || !salutation.equals(member.getSalutation()); }
        if (syncOrganization) { updated.setOrganization(organization); change = change || !organization.equals(member.getOrganization()); }
        if (syncdepartment)   { updated.setDepartment(department);     change = change || !department.equals(member.getDepartment()); }
        if (syncJobTitle)     { updated.setJobTitle(jobTitle);         change = change || !jobTitle.equals(member.getJobTitle()); }
        if (syncEmail)        { updated.setEmail(email);               change = change || !email.equals(member.getEmail()); }
        if (syncPhone)        { updated.setPhone(phone);               change = change || !phone.equals(member.getPhone()); }
        if (syncMobile)       { updated.setMobile(mobile);             change = change || !mobile.equals(member.getMobile()); }
        if (syncStreet)       { updated.setStreet(street);             change = change || !street.equals(member.getStreet()); }
        if (syncPostalCode)   { updated.setPostalCode(postalCode);     change = change || !postalCode.equals(member.getPostalCode()); }
        if (syncPoBox)        { updated.setPoBox(poBox);               change = change || !poBox.equals(member.getPoBox()); }
        if (syncLocality)     { updated.setLocality(locality);         change = change || !locality.equals(member.getLocality()); }
        if (syncRegion)       { updated.setRegion(region);             change = change || !region.equals(member.getRegion()); }
        if (syncCountry)      { updated.setCountry(country);           change = change || !country.equals(member.getCountry()); }
        if (syncAddress)      { updated.setAddress(address);           change = change || !address.equals(member.getAddress()); }
        if (syncInfo)         { updated.setInfo(info);                 change = change || !info.equals(member.getInfo()); }
        
        if (synchronizeGroups) {
          updated.setDeclaredGroups(groups);
          HashSet<Group> oldGroupSet = new HashSet<Group>(); Util.addAll(member.getDeclaredGroups(), oldGroupSet);
          HashSet<Group> newGroupSet = new HashSet<Group>(); Util.addAll(updated.getDeclaredGroups(), newGroupSet);
          change = change || (!Util.isSameContent(oldGroupSet, newGroupSet));
        }

        // Fix bug JCMS-3164 Disabled LDAP Member is not re-activated if there is 
        // not any difference between fields value of JCMS Member and LDAP user
        if (updated.isDisabled()) {
          change = true;
        }
        
        /*
         * Update the account:
         * - if it has been updated 
         * - if the last sync is older than 1 month
         * - if the member account has never been synchronized (account existed in the store before any LDAP was used)
         */
        long delta = System.currentTimeMillis() - (member.getLastLdapSynchro() != null ? member.getLastLdapSynchro().getTime() : 0);
        if (change || delta > JcmsConstants.MILLIS_IN_ONE_MONTH) {
          updated.setLastLdapSynchro(new Date());
          
          // JCMS-3388 - Do not systematically update the Member password when synchronizing a Member with the LDAP
          // Only update the password if the account was disable to ensure it is being enable again
          if (Util.isEmpty(member.getPassword()) || Member.DISABLED_PASSWORD.equals(member.getPassword())) {
            updated.setPassword(PasswordGenerator.generateRandomPassword(8));
          }

          ControllerStatus updateStatus = updated.checkUpdate(opAuthor);  
          if (updateStatus.hasFailed()) {
            logger.warn("Member [login:'"+ login + "', full name :'" + updated.getFullName() + "'] CANNOT be updated : " + updateStatus.getMessage(channel.getLanguage()));
            return member;
          }
          
          updated.performUpdate(opAuthor);
          if (logger.isDebugEnabled()) {
            logger.debug("Member '" + updated.getFullName() + "' ('"+updated.getId()+"') updated.");
          }
          SyncLdapHandler.updateLdapGroupSyncProgressInformation(SyncLdapHandler.SYNC_PROGRESS_MEMBER_UPDATED, member);
        }
      }
       SyncLdapHandler.updateLdapGroupSyncProgressInformation(SyncLdapHandler.SYNC_PROGRESS_MEMBER_TREATED, member);
      
    } // synchronized (memberCreationLock)

    return member;
  }

  /**
   * Retrieve groups of given user entry.
   * 
   * This method is called by 
   * {@link #synchronizeAccount(LDAPMapper, String, String, Member, boolean, boolean)}
   * when LDAP groups synchronizing is enabled (ldap.synchronize-groups.enable).
   * 
   * @param mapper     the LDAPMapper used to communicate with the LDAP
   * @param userEntry  the SearchResultEntry already retrieved for the member being synchronized.
   * @param mbr        the member being created or updated
   *                   beware that the member might not have been created yet.
   * @param opAuthor       the author of the operation (may be null)
   * @return an array of Group to be defined for this member, or null if you do not
   *         want groups to be modified.
   * @since jcms-5.7
   */
  protected static Group[] getAccountGroups(LDAPMapper mapper, SearchResultEntry userEntry,
      Member mbr, Member opAuthor) {
    Set<Group> ldapGroupSet = updateOrCreateGroups(mapper, userEntry, false, opAuthor, null, null);
    
    // Retrieve current member group set and remove all its ldap group to
    // replace them with the newly found ones
    Set<Group> mbrGroupSet = new HashSet<Group>();
    if (mbr != null) {
      Util.addAll(mbr.getDeclaredGroups(), mbrGroupSet);
    }
    for (Iterator<Group> it = mbrGroupSet.iterator(); it.hasNext();) {
      Group itGroup = it.next();
      if (itGroup.isLdapGroup()) {
        it.remove();
      }
    }
    mbrGroupSet.addAll(ldapGroupSet);
    
    // Return updated member's groups
    return mbrGroupSet.toArray(new Group[mbrGroupSet.size()]);
  }
  
  static private ThreadLocal<Map<String, Group>> synchronizedDnToGroupMap = new ThreadLocal<Map<String, Group>>();
  
  static public void initSynchronizedGroupsCache() {
    synchronizedDnToGroupMap.set(new HashMap<String, Group>());    
  }
  
  static public void clearSynchronizedGroupsCache() {
    synchronizedDnToGroupMap.remove();
  }
  
  /**
   * Synchronize groups of the given LDAP entry.
   * 
   * @param mapper     the LDAPMapper used to communicate with the LDAP
   * @param entry      the SearchResultEntry already retrieved for the member being synchronized.
   * @param importGroupChild whether to import group's members too (user or groups)
   * @param opAuthor   the author of the operation (may be null)
   * @param visitedCnSet a set containing all CN processed for the current group hierarchy, used to prevent infinite loop if circular reference are encountered (GroupA in GroupB in GroupC in GroupA)
   * @param cnToGroupMap a map of CN to Group, used to optimize performance (allows us to skip group which have already been processed/updated).
   *        eg: Member 1 belongs to GroupA and GroupB, GroupA belongs to GroupC, GroupB belongs to GroupC. When GroupC has been synchronized during synchronization of GroupA, there is no need to treat it a second time when synchronizing GroupB) 
   * @return a Set of created/updated {@link Group} to which the given LDAP entry belong, never return null.
   * @since jcms-5.7
   */
  protected static Set<Group> updateOrCreateGroups(LDAPMapper mapper, SearchResultEntry entry,
      boolean importGroupChild, Member opAuthor, LinkedHashSet<String> visitedCnSet, HashMap<String,Group> cnToGroupMap) {
    
    // Use log4j NDC (Nested Diagnostics Context) to clarify logging of recursive methods
    NDC.push(Integer.toHexString(entry.hashCode())); // NDC.pop in finally {...}
    try {
      if (logger.isDebugEnabled()) {
        logger.debug("updateOrCreateGroups [entryDN: '" + entry.getDN() + "', importGroupChild='" + importGroupChild +"']");
      }

      // A. Prevent infinite recusive loop
      visitedCnSet = (visitedCnSet != null) ? visitedCnSet : new LinkedHashSet<String>();
      if (visitedCnSet.contains(entry.getDN())) {
        logger.warn("Circular group reference detected in LDAP, Member & Group synchronization may not work properly, try to update your LDAP. The following LDAP entries are concerned :");
        int i = 0;
        for (String cn : visitedCnSet) {
          logger.warn(" " + (i++) + ". '" + cn + "'");
        }
        logger.warn(" " + (i++) + ". '" + entry.getDN() + "'...");
        return new HashSet<Group>();
      }
      visitedCnSet.add(entry.getDN()); // Add entry here, remove it in finally
      
      // B. Prevent double update of groups already treated
      cnToGroupMap = (cnToGroupMap != null) ? cnToGroupMap : new HashMap<String,Group>();
      Group groupAlreadyProcessed = cnToGroupMap.get(entry.getDN());
      // group Globally processed in a global synchronization action JCMS-1903
      Map<String, Group> globalCnToGroupMap = synchronizedDnToGroupMap.get();
      if (globalCnToGroupMap != null && groupAlreadyProcessed == null) {
        groupAlreadyProcessed = globalCnToGroupMap.get(entry.getDN());
      }
      
      if (groupAlreadyProcessed != null) {
        logger.debug("Entry already processed during this synchronization, skip it.");
        HashSet<Group> setWithOneGroup = new HashSet<Group>();
        setWithOneGroup.add(groupAlreadyProcessed);
        return setWithOneGroup; // FIX bug JCMS-1578
      }

      // 1. Find and import all LDAP groups entries referencing the given entry == "parent groups"
      HashSet<Group> parentGroupSet = importParentGroups(mapper, entry, opAuthor, visitedCnSet, cnToGroupMap);

      // 2. If it's not a group (then it's a member...), return immediately
      //    the set of groups to which the member belongs too.
      boolean isGroupEntry = LDAPUtil.isGroupEntry(entry, mapper.getLDAPConfiguration());
      if (!isGroupEntry) {
        return parentGroupSet;
      }
      
      // 3. It's a group, retrieve existing data if any
      String groupDN = entry.getDN();
      String groupName = LDAPUtil.getString(entry.getAttribute(GROUP_NAME_ATTR), "");
      if (Util.isEmpty(groupName)) {
        logger.warn("Could not retrieve group's name of LDAP entry '" + entry.getDN() + "'"+
                    " using LDAP attribute '"+GROUP_NAME_ATTR+"', check LDAP configuration.");
        groupName = "Group " + channel.getDateTimeFormat(channel.getLanguage()).format(new Date());
      }
      Group group = ldapMgr.getGroupFromDN(groupDN);

      // 4. If a JCMS group already existed for this LDAP group,
      //    check that we are allowed to synchronize it, otherwise return immediately
      if (group != null && group.getLdapSync() == false) {
        HashSet<Group> setWithOneGroup = new HashSet<Group>();
        setWithOneGroup.add(group);
        cnToGroupMap.put(entry.getDN(), group);
        if (globalCnToGroupMap != null ) {
          globalCnToGroupMap.put(entry.getDN(), group);
        }
        return setWithOneGroup;
      }
      
      // 5. If requested, import childs of groups (can be users or groups)
      Set<Data> childSet = new HashSet<Data>();
      if (/*isGroupEntry &&*/ importGroupChild) { 
        childSet = importGroupChild(mapper, entry, opAuthor);        
      }

      // 6. Make sure it's up to date, create or update it if needed.
      if (group == null) {
        group = createGroup(entry, opAuthor, parentGroupSet, groupDN, groupName);
        // If group could not be created, skip processing
        if (group == null) {
          return new HashSet<Group>();
        }
      } else {
        updateGroup(entry, opAuthor, parentGroupSet, groupDN, groupName, group);
      }
      SyncLdapHandler.updateLdapGroupSyncProgressInformation(SyncLdapHandler.SYNC_PROGRESS_GROUP_TREATED, group);

      // 7. Remove old children which are no longer in the Group 
      // Fix bug JCMS-2974 - case#1 : 
      //  LDAP Groups are not correctly removed from the JCMS Member 
      //  if they have been removed from the LDAP user
      // --> Iterate all LDAP members & groups to remove them from the 
      //     LDAP group if they have been removed on LDAP server side
      if (/*isGroupEntry &&*/ importGroupChild) {
        // Members
        for (Member childMember : group.getDeclaredMemberSet()) {
          if (!childMember.isLdapAccount() || childSet.contains(childMember)) {
            continue;
          }
          // The LDAP child member was not imported, it means it is not part of the
          // Group on the LDAP server anymore, and thus it should be removed from JCMS group too.
          // Request a member synchronization to ensure proper update
          synchronizeAccount(mapper, childMember.getLogin(), null, opAuthor, false, true);
        }
        // Groups
        for (Group childGroup : group.getChildrenSet()) {
          if (!childGroup.isLdapGroup() || childSet.contains(childGroup)) {
            continue;
          }
          // The LDAP child group was not imported, it means it is not part of the
          // Group on the LDAP server anymore, and thus it should be removed from JCMS group too.
          // Request a member synchronization to ensure proper update
          try {
            synchronizeGroup(mapper, childGroup, opAuthor);
          } catch (LDAPException ex) {
            logger.warn("Could not synchronize group " + childGroup, ex);
          }
        }
      }
      
      // return the created/updated group, so it can be added to parent set when doing recursive call
      HashSet<Group> setWithOneGroup = new HashSet<Group>();
      setWithOneGroup.add(group);
      cnToGroupMap.put(entry.getDN(), group);
      if (globalCnToGroupMap != null ) {
        globalCnToGroupMap.put(entry.getDN(), group);
      }
      return setWithOneGroup;

    } finally {
      visitedCnSet.remove(entry.getDN());
      NDC.pop();
    }
  }

  /**
   * Find and import all LDAP groups entries referencing the given entry == "parent groups".
   * 
   * @param mapper     the LDAPMapper used to communicate with the LDAP
   * @param entry      the SearchResultEntry already retrieved for the member being synchronized.
   * @param opAuthor   the author of the operation (may be null)
   * @param visitedCnSet
   * @return a Set of created/updated {@link Group} to which the given LDAP entry belong, never return null.
   */
  private static HashSet<Group> importParentGroups(LDAPMapper mapper, SearchResultEntry entry, Member opAuthor,
                                            LinkedHashSet<String> visitedCnSet, HashMap<String,Group> cnToGroupMap) {
    HashSet<Group> parentGroupSet = new HashSet<Group>();
    
    // 1 Retrieve all LDAP group entries which reference the given entry
    ArrayList<SearchResultEntry> groupEntryList;
    if (mapper.getLDAPConfiguration().isUsingPosixGroup()) {
      // when using posixGroup, the member field of ldap groups only contains the uid
      // of the user, not the full DN of the user entry.
      // Therefore, call the getGroupsLDAPEntries with the uid field value, not the full DN
      String uid = LDAPUtil.getString(entry.getAttribute(USER_LOGIN_ATTR), "");
      groupEntryList = mapper.getGroupsLDAPEntries(uid, GROUP_ATTRIBUTES);
    } else {
      groupEntryList = mapper.getGroupsLDAPEntries(entry.getDN(), GROUP_ATTRIBUTES);
    }
    

    // 2 Iterate on all LDAP entries (groups) referencing the given entry
    //   call ourself recursively to find and create/update parent groups
    if (Util.notEmpty(groupEntryList)) {
      for (SearchResultEntry groupSearchResultEntry : groupEntryList) {
        // Add the newly created or updated group to the parent set
        // Make sure we do not import child when calling this methods, as it will imports parents
        parentGroupSet.addAll(updateOrCreateGroups(mapper, groupSearchResultEntry, false, opAuthor, visitedCnSet, cnToGroupMap));
      }
    }
    return parentGroupSet;
  }

  /**
   * Import all childs of groups (can be users or groups).
   * 
   * @param mapper     the LDAPMapper used to communicate with the LDAP
   * @param entry      the SearchResultEntry already retrieved for the group being synchronized.
   * @param opAuthor   the author of the operation (may be null)
   * @return a set of all child Member and Group imported (created or updated)
   */
  private static Set<Data> importGroupChild(LDAPMapper mapper, SearchResultEntry entry, Member opAuthor) {
    // Iterate on all {MEMBER} attributes, as defined by property "ldap.grp-mapping.member" 
    // For each attribute, read entry,
    // if entry is group, as defined with objectclass property
    //  => updateOrCreateGroups
    // if entry is member, as defined with objectclass property
    //  => updateOrCreateAccount
    
    // Fill set of all child processed, use to fix bug JCMS-2974-case#1
    Set<Data> childSet = new HashSet<Data>(); // Member or groups
    
    List<String> groupChildList = mapper.getRangedAttributeStringValues(entry, GROUP_MEMBER_ATTR);
    for (String childDN : groupChildList) {
      // when using posixGroup, the member field only contains the uid, not
      // the full DN of the users, to retrieve the real full dn:
      if (mapper.getLDAPConfiguration().isUsingPosixGroup()) {
        childDN = "uid="+childDN+","+mapper.getLDAPConfiguration().getSuffix();
      }

      // Fix JCMS-2682 : LDAP user filter is not used when synchronizing child of a LDAP group
      // 
      // In order to fix this issue, we must not use the simple method "LDAPConnection.read(childDN)"
      // Doing this would not apply the user or group filter configured in JCMS.
      // Instead invoke custom made search method.
      // Warning : it has a small performance penalty because we will perform two
      // LDAP search if the childDN did not match a user because of the filter.
      // Possible improvement : The best way do implement this would be to read the 
      // child entry and have a simple method entry.matchFilter()...

      // Attempt to retrieve this child DN as a User Entry, using proper member filter
      SearchResultEntry childUserEntry = mapper.getUserLDAPEntryFromDN(childDN, USER_ATTRIBUTES);
      if (childUserEntry != null) {
        Member child = updateOrCreateAccount(mapper, childUserEntry, null, opAuthor);
        childSet.add(child);
        continue;
      }

      // If the DN did not match any valid user : 
      // Attempt to retrieve this child DN as a Group Entry, using proper group filter
      SearchResultEntry childGroupEntry = mapper.getGroupLDAPEntryFromDN(childDN, GROUP_ATTRIBUTES);
      if (childGroupEntry != null) {
        Set<Group> childs = updateOrCreateGroups(mapper, childGroupEntry, false, opAuthor, null, null);
        childSet.addAll(childs);
        continue;
      }
    }
    
    return childSet;
  }

  /**
   * Create a new JCMS group using specified informations.
   * 
   * @param entry      the SearchResultEntry already retrieved for the group being synchronized.
   * @param opAuthor   the author of the operation (may be null)
   * @param parentGroupSet a Set of {@link Group} to which this group belongs
   * @param groupDN    The LDAP distinguish name of the group to create
   * @param groupName  The name of the group to create
   * @return the create JCMS {@link Group}
   */
  private static Group createGroup(SearchResultEntry entry, Member opAuthor, HashSet<Group> parentGroupSet, String groupDN, String groupName) {
    Group group;
    if (logger.isDebugEnabled()) {
      logger.debug("Group [dn:'"+ entry.getDN() + "', name:'" + groupName + "'] does not exists yet, create it...");
    }
    group = new Group();
    group.setName(groupName);
    group.setLastLdapSynchro(new Date());
    group.setLdapDN(groupDN);
    group.setParentSet(parentGroupSet);
    group.setUseCategorySet(new TreeSet<Category>()); // Fix JCMS-2271 : Ensure no default use right is defined 
    
    /**
     * Uncomment this if you want to ensure integrity of created group.
     * Default behavior of JCMS is not to care, otherwise it would prevent creation
     * of LDAP Group "Foo" if an JCMS Group "Foo" was already existing. We don't want that
     */
    /*
    ControllerStatus createStatus = group.checkCreate(opAuthor); 
    if (createStatus.hasFailed()) {
      logger.warn("Group [db:'"+ entry.getDN() + "', name :'" + groupName + "'] CANNOT be created : " + createStatus.getMessage(channel.getLanguage()));
      return null;
    } 
    */        
    
    group.performCreate(opAuthor);    
    if (logger.isDebugEnabled()) {
      logger.debug("Group '" + groupName + "' ('"+group.getId()+"') created.");
    }
    SyncLdapHandler.updateLdapGroupSyncProgressInformation(SyncLdapHandler.SYNC_PROGRESS_GROUP_CREATED, group);
    return group;
  }

  /**
   * Update the specified JCMS group using specified informations.
   * 
   * @param entry      the SearchResultEntry already retrieved for the group being synchronized.
   * @param opAuthor   the author of the operation (may be null)
   * @param parentGroupSet a Set of {@link Group} to which this group belongs
   * @param groupDN    The LDAP distinguish name of the group to create
   * @param groupName  The name of the group to create
   * @param group      The existing JCMS {@link Group} that must be updated
   */
  private static void updateGroup(SearchResultEntry entry, Member opAuthor, HashSet<Group> parentGroupSet, String groupDN, String groupName, Group group) {
    if (logger.isDebugEnabled()) {
      logger.debug("Group [dn:'"+ entry.getDN() + "', name:'" + groupName + "'] already exists, update it if needed...");
    }

    Group updated = new Group(group);
    // Remove all LDAP groups from parent set to replace it with new ones
    HashSet<Group> parentSet = updated.getParentSet() != null ? new HashSet<Group>(updated.getParentSet()) : new HashSet<Group>();  // don't forget to clone the set otherwise it's the original set that will be updated
    for (Iterator<Group> it = parentSet.iterator(); it.hasNext();) {
      Group itGroup = it.next();
      if (itGroup.isLdapGroup()) {
        it.remove();
      }
    }
    parentSet.addAll(parentGroupSet);
    
    boolean change = false;
    updated.setName(groupName);      change = change || !updated.getName().equals(group.getName());
    updated.setParentSet(parentSet); change = change || !Util.isSameContent(group.getParentSet(), updated.getParentSet());

    // Fix bug JCMS-3041 : LDAP Group created manually from JCMS with its DN field does not appear with the appropriate icon when synchronized
    // Force change if last LDAP Synchro date has never been set so we can clearly tag the group has an LDAP group
    change = change || group.getLastLdapSynchro() == null;
    
    // Update group if changed
    if (change) {
      updated.setLastLdapSynchro(new Date());
      updated.setLdapDN(groupDN);

      /**
       * Uncomment this if you want to ensure integrity of updated group.
       */
      /*
      ControllerStatus updateStatus = updated.checkUpdate(opAuthor);  
      if (updateStatus.hasFailed()) {
        logger.warn("Group [dn:'"+ entry.getDN() + "', name:'" + groupName + "'] CANNOT be updated : " + updateStatus.getMessage(channel.getLanguage()));
        return;
      } 
      */        
      
      updated.performUpdate(opAuthor);
      if (logger.isDebugEnabled()) {
        logger.debug("Group '" + groupName + "' ('"+updated.getId()+"') updated.");
      }
      SyncLdapHandler.updateLdapGroupSyncProgressInformation(SyncLdapHandler.SYNC_PROGRESS_GROUP_UPDATED, group);
    }
  }
  
}
