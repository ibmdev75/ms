// This file was automatically generated. Please, do not edit.
// Generation date : Sat Apr 04 12:22:35 CEST 2015
package generated;
import java.util.TreeMap;
import com.jalios.jcms.AbstractLinkIndexListener;
import com.jalios.jstore.Storable;
@SuppressWarnings({"unchecked"})
public class LinkIndexListener extends AbstractLinkIndexListener {
  
  public LinkIndexListener(TreeMap index) {
    super(index);
  }
  
  public void handleCreate(Storable storable, boolean firstTime) {
    // AbstractCollection
    if (storable instanceof AbstractCollection) {
      AbstractCollection obj = (AbstractCollection)storable;
      
      // children
      add(obj, obj.getChildren(), "children");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // AbstractParent
    if (storable instanceof AbstractParent) {
      AbstractParent obj = (AbstractParent)storable;
      
      // child
      add(obj, obj.getChild(), "child");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // AbstractPortal
    if (storable instanceof AbstractPortal) {
      AbstractPortal obj = (AbstractPortal)storable;
      
      // child
      add(obj, obj.getChild(), "child");
    }
    // AbstractPortlet
    if (storable instanceof AbstractPortlet) {
      AbstractPortlet obj = (AbstractPortlet)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // AbstractPortletSkinable
    if (storable instanceof AbstractPortletSkinable) {
      AbstractPortletSkinable obj = (AbstractPortletSkinable)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // AbstractPortletStat
    if (storable instanceof AbstractPortletStat) {
      AbstractPortletStat obj = (AbstractPortletStat)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // AbstractPortletStatReport
    if (storable instanceof AbstractPortletStatReport) {
      AbstractPortletStatReport obj = (AbstractPortletStatReport)storable;
      
      // children
      add(obj, obj.getChildren(), "children");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // Article
    if (storable instanceof Article) {
      Article obj = (Article)storable;
      
      // relatedContents
      add(obj, obj.getRelatedContents(false), "relatedContents");
    }
    // FaqEntry
    if (storable instanceof FaqEntry) {
      FaqEntry obj = (FaqEntry)storable;
      
      // faq
      add(obj, obj.getFaq(), "faq");
    }
    // GlossaryEntry
    if (storable instanceof GlossaryEntry) {
      GlossaryEntry obj = (GlossaryEntry)storable;
      
      // seeAlso
      add(obj, obj.getSeeAlso(), "seeAlso");
      // glossary
      add(obj, obj.getGlossary(), "glossary");
    }
    // PortalJspCollection
    if (storable instanceof PortalJspCollection) {
      PortalJspCollection obj = (PortalJspCollection)storable;
      
      // children
      add(obj, obj.getChildren(), "children");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletColumn
    if (storable instanceof PortletColumn) {
      PortletColumn obj = (PortletColumn)storable;
      
      // children
      add(obj, obj.getChildren(), "children");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletDecorator
    if (storable instanceof PortletDecorator) {
      PortletDecorator obj = (PortletDecorator)storable;
      
      // child
      add(obj, obj.getChild(), "child");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletFeed
    if (storable instanceof PortletFeed) {
      PortletFeed obj = (PortletFeed)storable;
      
      // firstPublications
      add(obj, obj.getFirstPublications(false), "firstPublications");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletIFrame
    if (storable instanceof PortletIFrame) {
      PortletIFrame obj = (PortletIFrame)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletImage
    if (storable instanceof PortletImage) {
      PortletImage obj = (PortletImage)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletJsp
    if (storable instanceof PortletJsp) {
      PortletJsp obj = (PortletJsp)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletJspCollection
    if (storable instanceof PortletJspCollection) {
      PortletJspCollection obj = (PortletJspCollection)storable;
      
      // children
      add(obj, obj.getChildren(), "children");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletLoggedMembers
    if (storable instanceof PortletLoggedMembers) {
      PortletLoggedMembers obj = (PortletLoggedMembers)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletLogin
    if (storable instanceof PortletLogin) {
      PortletLogin obj = (PortletLogin)storable;
      
      // displayPortal
      add(obj, obj.getDisplayPortal(), "displayPortal");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletMenu
    if (storable instanceof PortletMenu) {
      PortletMenu obj = (PortletMenu)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletMyLocks
    if (storable instanceof PortletMyLocks) {
      PortletMyLocks obj = (PortletMyLocks)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletNavigate
    if (storable instanceof PortletNavigate) {
      PortletNavigate obj = (PortletNavigate)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletNotification
    if (storable instanceof PortletNotification) {
      PortletNotification obj = (PortletNotification)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletPortal
    if (storable instanceof PortletPortal) {
      PortletPortal obj = (PortletPortal)storable;
      
      // child
      add(obj, obj.getChild(), "child");
    }
    // PortletPortalRedirect
    if (storable instanceof PortletPortalRedirect) {
      PortletPortalRedirect obj = (PortletPortalRedirect)storable;
      
      // content
      add(obj, obj.getContent(false), "content");
      // redirectPortlet
      add(obj, obj.getRedirectPortlet(), "redirectPortlet");
      // dispPortal
      add(obj, obj.getDispPortal(), "dispPortal");
    }
    // PortletQueryForeach
    if (storable instanceof PortletQueryForeach) {
      PortletQueryForeach obj = (PortletQueryForeach)storable;
      
      // firstPublications
      add(obj, obj.getFirstPublications(false), "firstPublications");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletQueryForeachDetail
    if (storable instanceof PortletQueryForeachDetail) {
      PortletQueryForeachDetail obj = (PortletQueryForeachDetail)storable;
      
      // firstPublications
      add(obj, obj.getFirstPublications(false), "firstPublications");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletRecentHistory
    if (storable instanceof PortletRecentHistory) {
      PortletRecentHistory obj = (PortletRecentHistory)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletRow
    if (storable instanceof PortletRow) {
      PortletRow obj = (PortletRow)storable;
      
      // children
      add(obj, obj.getChildren(), "children");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletRSS
    if (storable instanceof PortletRSS) {
      PortletRSS obj = (PortletRSS)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletSearch
    if (storable instanceof PortletSearch) {
      PortletSearch obj = (PortletSearch)storable;
      
      // queryPortlet
      add(obj, obj.getQueryPortlet(), "queryPortlet");
      // displayPortal
      add(obj, obj.getDisplayPortal(), "displayPortal");
      // advancedSearchPortlet
      add(obj, obj.getAdvancedSearchPortlet(), "advancedSearchPortlet");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletSelection
    if (storable instanceof PortletSelection) {
      PortletSelection obj = (PortletSelection)storable;
      
      // children
      add(obj, obj.getChildren(), "children");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletSignUp
    if (storable instanceof PortletSignUp) {
      PortletSignUp obj = (PortletSignUp)storable;
      
      // displayPortal
      add(obj, obj.getDisplayPortal(), "displayPortal");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletStatMetrics
    if (storable instanceof PortletStatMetrics) {
      PortletStatMetrics obj = (PortletStatMetrics)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletStatReport
    if (storable instanceof PortletStatReport) {
      PortletStatReport obj = (PortletStatReport)storable;
      
      // children
      add(obj, obj.getChildren(), "children");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletTopMember
    if (storable instanceof PortletTopMember) {
      PortletTopMember obj = (PortletTopMember)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletWorkflow
    if (storable instanceof PortletWorkflow) {
      PortletWorkflow obj = (PortletWorkflow)storable;
      
      // firstPublications
      add(obj, obj.getFirstPublications(false), "firstPublications");
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // PortletWYSIWYG
    if (storable instanceof PortletWYSIWYG) {
      PortletWYSIWYG obj = (PortletWYSIWYG)storable;
      
      // originalPortlet
      add(obj, obj.getOriginalPortlet(), "originalPortlet");
    }
    // ArticleMS
    if (storable instanceof ArticleMS) {
      ArticleMS obj = (ArticleMS)storable;
      
      // relatedContents
      add(obj, obj.getRelatedContents(false), "relatedContents");
      // tag
      add(obj, obj.getTag(), "tag");
    }
    // Tag
    if (storable instanceof Tag) {
      Tag obj = (Tag)storable;
      
      // url
      add(obj, obj.getUrl(), "url");
    }
  }
  
  public void handleCommitUpdate(Storable storable, Storable oldStorable, boolean firstTime) {
    // AbstractCollection    
    if (storable instanceof AbstractCollection) {
      AbstractCollection obj = (AbstractCollection)storable;
      AbstractCollection oldObj = (AbstractCollection)oldStorable;
      
      // children
      if (obj.getChildren() != oldObj.getChildren()) {
        remove(obj, oldObj.getChildren(), "children");
        add(obj, obj.getChildren(), "children");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // AbstractParent    
    if (storable instanceof AbstractParent) {
      AbstractParent obj = (AbstractParent)storable;
      AbstractParent oldObj = (AbstractParent)oldStorable;
      
      // child
      if (obj.getChild() != oldObj.getChild()) {
        remove(obj, oldObj.getChild(), "child");
        add(obj, obj.getChild(), "child");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // AbstractPortal    
    if (storable instanceof AbstractPortal) {
      AbstractPortal obj = (AbstractPortal)storable;
      AbstractPortal oldObj = (AbstractPortal)oldStorable;
      
      // child
      if (obj.getChild() != oldObj.getChild()) {
        remove(obj, oldObj.getChild(), "child");
        add(obj, obj.getChild(), "child");
      }
    }
    // AbstractPortlet    
    if (storable instanceof AbstractPortlet) {
      AbstractPortlet obj = (AbstractPortlet)storable;
      AbstractPortlet oldObj = (AbstractPortlet)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // AbstractPortletSkinable    
    if (storable instanceof AbstractPortletSkinable) {
      AbstractPortletSkinable obj = (AbstractPortletSkinable)storable;
      AbstractPortletSkinable oldObj = (AbstractPortletSkinable)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // AbstractPortletStat    
    if (storable instanceof AbstractPortletStat) {
      AbstractPortletStat obj = (AbstractPortletStat)storable;
      AbstractPortletStat oldObj = (AbstractPortletStat)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // AbstractPortletStatReport    
    if (storable instanceof AbstractPortletStatReport) {
      AbstractPortletStatReport obj = (AbstractPortletStatReport)storable;
      AbstractPortletStatReport oldObj = (AbstractPortletStatReport)oldStorable;
      
      // children
      if (obj.getChildren() != oldObj.getChildren()) {
        remove(obj, oldObj.getChildren(), "children");
        add(obj, obj.getChildren(), "children");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // Article    
    if (storable instanceof Article) {
      Article obj = (Article)storable;
      Article oldObj = (Article)oldStorable;
      
      // relatedContents
      if (obj.getRelatedContents(false) != oldObj.getRelatedContents(false)) {
        remove(obj, oldObj.getRelatedContents(false), "relatedContents");
        add(obj, obj.getRelatedContents(false), "relatedContents");
      }
    }
    // FaqEntry    
    if (storable instanceof FaqEntry) {
      FaqEntry obj = (FaqEntry)storable;
      FaqEntry oldObj = (FaqEntry)oldStorable;
      
      // faq
      if (obj.getFaq() != oldObj.getFaq()) {
        remove(obj, oldObj.getFaq(), "faq");
        add(obj, obj.getFaq(), "faq");
      }
    }
    // GlossaryEntry    
    if (storable instanceof GlossaryEntry) {
      GlossaryEntry obj = (GlossaryEntry)storable;
      GlossaryEntry oldObj = (GlossaryEntry)oldStorable;
      
      // seeAlso
      if (obj.getSeeAlso() != oldObj.getSeeAlso()) {
        remove(obj, oldObj.getSeeAlso(), "seeAlso");
        add(obj, obj.getSeeAlso(), "seeAlso");
      }
      // glossary
      if (obj.getGlossary() != oldObj.getGlossary()) {
        remove(obj, oldObj.getGlossary(), "glossary");
        add(obj, obj.getGlossary(), "glossary");
      }
    }
    // PortalJspCollection    
    if (storable instanceof PortalJspCollection) {
      PortalJspCollection obj = (PortalJspCollection)storable;
      PortalJspCollection oldObj = (PortalJspCollection)oldStorable;
      
      // children
      if (obj.getChildren() != oldObj.getChildren()) {
        remove(obj, oldObj.getChildren(), "children");
        add(obj, obj.getChildren(), "children");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletColumn    
    if (storable instanceof PortletColumn) {
      PortletColumn obj = (PortletColumn)storable;
      PortletColumn oldObj = (PortletColumn)oldStorable;
      
      // children
      if (obj.getChildren() != oldObj.getChildren()) {
        remove(obj, oldObj.getChildren(), "children");
        add(obj, obj.getChildren(), "children");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletDecorator    
    if (storable instanceof PortletDecorator) {
      PortletDecorator obj = (PortletDecorator)storable;
      PortletDecorator oldObj = (PortletDecorator)oldStorable;
      
      // child
      if (obj.getChild() != oldObj.getChild()) {
        remove(obj, oldObj.getChild(), "child");
        add(obj, obj.getChild(), "child");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletFeed    
    if (storable instanceof PortletFeed) {
      PortletFeed obj = (PortletFeed)storable;
      PortletFeed oldObj = (PortletFeed)oldStorable;
      
      // firstPublications
      if (obj.getFirstPublications(false) != oldObj.getFirstPublications(false)) {
        remove(obj, oldObj.getFirstPublications(false), "firstPublications");
        add(obj, obj.getFirstPublications(false), "firstPublications");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletIFrame    
    if (storable instanceof PortletIFrame) {
      PortletIFrame obj = (PortletIFrame)storable;
      PortletIFrame oldObj = (PortletIFrame)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletImage    
    if (storable instanceof PortletImage) {
      PortletImage obj = (PortletImage)storable;
      PortletImage oldObj = (PortletImage)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletJsp    
    if (storable instanceof PortletJsp) {
      PortletJsp obj = (PortletJsp)storable;
      PortletJsp oldObj = (PortletJsp)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletJspCollection    
    if (storable instanceof PortletJspCollection) {
      PortletJspCollection obj = (PortletJspCollection)storable;
      PortletJspCollection oldObj = (PortletJspCollection)oldStorable;
      
      // children
      if (obj.getChildren() != oldObj.getChildren()) {
        remove(obj, oldObj.getChildren(), "children");
        add(obj, obj.getChildren(), "children");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletLoggedMembers    
    if (storable instanceof PortletLoggedMembers) {
      PortletLoggedMembers obj = (PortletLoggedMembers)storable;
      PortletLoggedMembers oldObj = (PortletLoggedMembers)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletLogin    
    if (storable instanceof PortletLogin) {
      PortletLogin obj = (PortletLogin)storable;
      PortletLogin oldObj = (PortletLogin)oldStorable;
      
      // displayPortal
      if (obj.getDisplayPortal() != oldObj.getDisplayPortal()) {
        remove(obj, oldObj.getDisplayPortal(), "displayPortal");
        add(obj, obj.getDisplayPortal(), "displayPortal");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletMenu    
    if (storable instanceof PortletMenu) {
      PortletMenu obj = (PortletMenu)storable;
      PortletMenu oldObj = (PortletMenu)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletMyLocks    
    if (storable instanceof PortletMyLocks) {
      PortletMyLocks obj = (PortletMyLocks)storable;
      PortletMyLocks oldObj = (PortletMyLocks)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletNavigate    
    if (storable instanceof PortletNavigate) {
      PortletNavigate obj = (PortletNavigate)storable;
      PortletNavigate oldObj = (PortletNavigate)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletNotification    
    if (storable instanceof PortletNotification) {
      PortletNotification obj = (PortletNotification)storable;
      PortletNotification oldObj = (PortletNotification)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletPortal    
    if (storable instanceof PortletPortal) {
      PortletPortal obj = (PortletPortal)storable;
      PortletPortal oldObj = (PortletPortal)oldStorable;
      
      // child
      if (obj.getChild() != oldObj.getChild()) {
        remove(obj, oldObj.getChild(), "child");
        add(obj, obj.getChild(), "child");
      }
    }
    // PortletPortalRedirect    
    if (storable instanceof PortletPortalRedirect) {
      PortletPortalRedirect obj = (PortletPortalRedirect)storable;
      PortletPortalRedirect oldObj = (PortletPortalRedirect)oldStorable;
      
      // content
      if (obj.getContent(false) != oldObj.getContent(false)) {
        remove(obj, oldObj.getContent(false), "content");
        add(obj, obj.getContent(false), "content");
      }
      // redirectPortlet
      if (obj.getRedirectPortlet() != oldObj.getRedirectPortlet()) {
        remove(obj, oldObj.getRedirectPortlet(), "redirectPortlet");
        add(obj, obj.getRedirectPortlet(), "redirectPortlet");
      }
      // dispPortal
      if (obj.getDispPortal() != oldObj.getDispPortal()) {
        remove(obj, oldObj.getDispPortal(), "dispPortal");
        add(obj, obj.getDispPortal(), "dispPortal");
      }
    }
    // PortletQueryForeach    
    if (storable instanceof PortletQueryForeach) {
      PortletQueryForeach obj = (PortletQueryForeach)storable;
      PortletQueryForeach oldObj = (PortletQueryForeach)oldStorable;
      
      // firstPublications
      if (obj.getFirstPublications(false) != oldObj.getFirstPublications(false)) {
        remove(obj, oldObj.getFirstPublications(false), "firstPublications");
        add(obj, obj.getFirstPublications(false), "firstPublications");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletQueryForeachDetail    
    if (storable instanceof PortletQueryForeachDetail) {
      PortletQueryForeachDetail obj = (PortletQueryForeachDetail)storable;
      PortletQueryForeachDetail oldObj = (PortletQueryForeachDetail)oldStorable;
      
      // firstPublications
      if (obj.getFirstPublications(false) != oldObj.getFirstPublications(false)) {
        remove(obj, oldObj.getFirstPublications(false), "firstPublications");
        add(obj, obj.getFirstPublications(false), "firstPublications");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletRecentHistory    
    if (storable instanceof PortletRecentHistory) {
      PortletRecentHistory obj = (PortletRecentHistory)storable;
      PortletRecentHistory oldObj = (PortletRecentHistory)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletRow    
    if (storable instanceof PortletRow) {
      PortletRow obj = (PortletRow)storable;
      PortletRow oldObj = (PortletRow)oldStorable;
      
      // children
      if (obj.getChildren() != oldObj.getChildren()) {
        remove(obj, oldObj.getChildren(), "children");
        add(obj, obj.getChildren(), "children");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletRSS    
    if (storable instanceof PortletRSS) {
      PortletRSS obj = (PortletRSS)storable;
      PortletRSS oldObj = (PortletRSS)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletSearch    
    if (storable instanceof PortletSearch) {
      PortletSearch obj = (PortletSearch)storable;
      PortletSearch oldObj = (PortletSearch)oldStorable;
      
      // queryPortlet
      if (obj.getQueryPortlet() != oldObj.getQueryPortlet()) {
        remove(obj, oldObj.getQueryPortlet(), "queryPortlet");
        add(obj, obj.getQueryPortlet(), "queryPortlet");
      }
      // displayPortal
      if (obj.getDisplayPortal() != oldObj.getDisplayPortal()) {
        remove(obj, oldObj.getDisplayPortal(), "displayPortal");
        add(obj, obj.getDisplayPortal(), "displayPortal");
      }
      // advancedSearchPortlet
      if (obj.getAdvancedSearchPortlet() != oldObj.getAdvancedSearchPortlet()) {
        remove(obj, oldObj.getAdvancedSearchPortlet(), "advancedSearchPortlet");
        add(obj, obj.getAdvancedSearchPortlet(), "advancedSearchPortlet");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletSelection    
    if (storable instanceof PortletSelection) {
      PortletSelection obj = (PortletSelection)storable;
      PortletSelection oldObj = (PortletSelection)oldStorable;
      
      // children
      if (obj.getChildren() != oldObj.getChildren()) {
        remove(obj, oldObj.getChildren(), "children");
        add(obj, obj.getChildren(), "children");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletSignUp    
    if (storable instanceof PortletSignUp) {
      PortletSignUp obj = (PortletSignUp)storable;
      PortletSignUp oldObj = (PortletSignUp)oldStorable;
      
      // displayPortal
      if (obj.getDisplayPortal() != oldObj.getDisplayPortal()) {
        remove(obj, oldObj.getDisplayPortal(), "displayPortal");
        add(obj, obj.getDisplayPortal(), "displayPortal");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletStatMetrics    
    if (storable instanceof PortletStatMetrics) {
      PortletStatMetrics obj = (PortletStatMetrics)storable;
      PortletStatMetrics oldObj = (PortletStatMetrics)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletStatReport    
    if (storable instanceof PortletStatReport) {
      PortletStatReport obj = (PortletStatReport)storable;
      PortletStatReport oldObj = (PortletStatReport)oldStorable;
      
      // children
      if (obj.getChildren() != oldObj.getChildren()) {
        remove(obj, oldObj.getChildren(), "children");
        add(obj, obj.getChildren(), "children");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletTopMember    
    if (storable instanceof PortletTopMember) {
      PortletTopMember obj = (PortletTopMember)storable;
      PortletTopMember oldObj = (PortletTopMember)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletWorkflow    
    if (storable instanceof PortletWorkflow) {
      PortletWorkflow obj = (PortletWorkflow)storable;
      PortletWorkflow oldObj = (PortletWorkflow)oldStorable;
      
      // firstPublications
      if (obj.getFirstPublications(false) != oldObj.getFirstPublications(false)) {
        remove(obj, oldObj.getFirstPublications(false), "firstPublications");
        add(obj, obj.getFirstPublications(false), "firstPublications");
      }
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // PortletWYSIWYG    
    if (storable instanceof PortletWYSIWYG) {
      PortletWYSIWYG obj = (PortletWYSIWYG)storable;
      PortletWYSIWYG oldObj = (PortletWYSIWYG)oldStorable;
      
      // originalPortlet
      if (obj.getOriginalPortlet() != oldObj.getOriginalPortlet()) {
        remove(obj, oldObj.getOriginalPortlet(), "originalPortlet");
        add(obj, obj.getOriginalPortlet(), "originalPortlet");
      }
    }
    // ArticleMS    
    if (storable instanceof ArticleMS) {
      ArticleMS obj = (ArticleMS)storable;
      ArticleMS oldObj = (ArticleMS)oldStorable;
      
      // relatedContents
      if (obj.getRelatedContents(false) != oldObj.getRelatedContents(false)) {
        remove(obj, oldObj.getRelatedContents(false), "relatedContents");
        add(obj, obj.getRelatedContents(false), "relatedContents");
      }
      // tag
      if (obj.getTag() != oldObj.getTag()) {
        remove(obj, oldObj.getTag(), "tag");
        add(obj, obj.getTag(), "tag");
      }
    }
    // Tag    
    if (storable instanceof Tag) {
      Tag obj = (Tag)storable;
      Tag oldObj = (Tag)oldStorable;
      
      // url
      if (obj.getUrl() != oldObj.getUrl()) {
        remove(obj, oldObj.getUrl(), "url");
        add(obj, obj.getUrl(), "url");
      }
    }
  }
  
  public void handleDelete(Storable storable, boolean firstTime) {
    // AbstractCollection   
    if (storable instanceof AbstractCollection) {
      AbstractCollection obj = (AbstractCollection)storable;
    
      // children
      remove(obj, obj.getChildren(), "children");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // AbstractParent   
    if (storable instanceof AbstractParent) {
      AbstractParent obj = (AbstractParent)storable;
    
      // child
      remove(obj, obj.getChild(), "child");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // AbstractPortal   
    if (storable instanceof AbstractPortal) {
      AbstractPortal obj = (AbstractPortal)storable;
    
      // child
      remove(obj, obj.getChild(), "child");
    }    
    // AbstractPortlet   
    if (storable instanceof AbstractPortlet) {
      AbstractPortlet obj = (AbstractPortlet)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // AbstractPortletSkinable   
    if (storable instanceof AbstractPortletSkinable) {
      AbstractPortletSkinable obj = (AbstractPortletSkinable)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // AbstractPortletStat   
    if (storable instanceof AbstractPortletStat) {
      AbstractPortletStat obj = (AbstractPortletStat)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // AbstractPortletStatReport   
    if (storable instanceof AbstractPortletStatReport) {
      AbstractPortletStatReport obj = (AbstractPortletStatReport)storable;
    
      // children
      remove(obj, obj.getChildren(), "children");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // Article   
    if (storable instanceof Article) {
      Article obj = (Article)storable;
    
      // relatedContents
      remove(obj, obj.getRelatedContents(false), "relatedContents");
    }    
    // FaqEntry   
    if (storable instanceof FaqEntry) {
      FaqEntry obj = (FaqEntry)storable;
    
      // faq
      remove(obj, obj.getFaq(), "faq");
    }    
    // GlossaryEntry   
    if (storable instanceof GlossaryEntry) {
      GlossaryEntry obj = (GlossaryEntry)storable;
    
      // seeAlso
      remove(obj, obj.getSeeAlso(), "seeAlso");
      // glossary
      remove(obj, obj.getGlossary(), "glossary");
    }    
    // PortalJspCollection   
    if (storable instanceof PortalJspCollection) {
      PortalJspCollection obj = (PortalJspCollection)storable;
    
      // children
      remove(obj, obj.getChildren(), "children");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletColumn   
    if (storable instanceof PortletColumn) {
      PortletColumn obj = (PortletColumn)storable;
    
      // children
      remove(obj, obj.getChildren(), "children");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletDecorator   
    if (storable instanceof PortletDecorator) {
      PortletDecorator obj = (PortletDecorator)storable;
    
      // child
      remove(obj, obj.getChild(), "child");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletFeed   
    if (storable instanceof PortletFeed) {
      PortletFeed obj = (PortletFeed)storable;
    
      // firstPublications
      remove(obj, obj.getFirstPublications(false), "firstPublications");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletIFrame   
    if (storable instanceof PortletIFrame) {
      PortletIFrame obj = (PortletIFrame)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletImage   
    if (storable instanceof PortletImage) {
      PortletImage obj = (PortletImage)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletJsp   
    if (storable instanceof PortletJsp) {
      PortletJsp obj = (PortletJsp)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletJspCollection   
    if (storable instanceof PortletJspCollection) {
      PortletJspCollection obj = (PortletJspCollection)storable;
    
      // children
      remove(obj, obj.getChildren(), "children");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletLoggedMembers   
    if (storable instanceof PortletLoggedMembers) {
      PortletLoggedMembers obj = (PortletLoggedMembers)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletLogin   
    if (storable instanceof PortletLogin) {
      PortletLogin obj = (PortletLogin)storable;
    
      // displayPortal
      remove(obj, obj.getDisplayPortal(), "displayPortal");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletMenu   
    if (storable instanceof PortletMenu) {
      PortletMenu obj = (PortletMenu)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletMyLocks   
    if (storable instanceof PortletMyLocks) {
      PortletMyLocks obj = (PortletMyLocks)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletNavigate   
    if (storable instanceof PortletNavigate) {
      PortletNavigate obj = (PortletNavigate)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletNotification   
    if (storable instanceof PortletNotification) {
      PortletNotification obj = (PortletNotification)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletPortal   
    if (storable instanceof PortletPortal) {
      PortletPortal obj = (PortletPortal)storable;
    
      // child
      remove(obj, obj.getChild(), "child");
    }    
    // PortletPortalRedirect   
    if (storable instanceof PortletPortalRedirect) {
      PortletPortalRedirect obj = (PortletPortalRedirect)storable;
    
      // content
      remove(obj, obj.getContent(false), "content");
      // redirectPortlet
      remove(obj, obj.getRedirectPortlet(), "redirectPortlet");
      // dispPortal
      remove(obj, obj.getDispPortal(), "dispPortal");
    }    
    // PortletQueryForeach   
    if (storable instanceof PortletQueryForeach) {
      PortletQueryForeach obj = (PortletQueryForeach)storable;
    
      // firstPublications
      remove(obj, obj.getFirstPublications(false), "firstPublications");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletQueryForeachDetail   
    if (storable instanceof PortletQueryForeachDetail) {
      PortletQueryForeachDetail obj = (PortletQueryForeachDetail)storable;
    
      // firstPublications
      remove(obj, obj.getFirstPublications(false), "firstPublications");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletRecentHistory   
    if (storable instanceof PortletRecentHistory) {
      PortletRecentHistory obj = (PortletRecentHistory)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletRow   
    if (storable instanceof PortletRow) {
      PortletRow obj = (PortletRow)storable;
    
      // children
      remove(obj, obj.getChildren(), "children");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletRSS   
    if (storable instanceof PortletRSS) {
      PortletRSS obj = (PortletRSS)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletSearch   
    if (storable instanceof PortletSearch) {
      PortletSearch obj = (PortletSearch)storable;
    
      // queryPortlet
      remove(obj, obj.getQueryPortlet(), "queryPortlet");
      // displayPortal
      remove(obj, obj.getDisplayPortal(), "displayPortal");
      // advancedSearchPortlet
      remove(obj, obj.getAdvancedSearchPortlet(), "advancedSearchPortlet");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletSelection   
    if (storable instanceof PortletSelection) {
      PortletSelection obj = (PortletSelection)storable;
    
      // children
      remove(obj, obj.getChildren(), "children");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletSignUp   
    if (storable instanceof PortletSignUp) {
      PortletSignUp obj = (PortletSignUp)storable;
    
      // displayPortal
      remove(obj, obj.getDisplayPortal(), "displayPortal");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletStatMetrics   
    if (storable instanceof PortletStatMetrics) {
      PortletStatMetrics obj = (PortletStatMetrics)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletStatReport   
    if (storable instanceof PortletStatReport) {
      PortletStatReport obj = (PortletStatReport)storable;
    
      // children
      remove(obj, obj.getChildren(), "children");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletTopMember   
    if (storable instanceof PortletTopMember) {
      PortletTopMember obj = (PortletTopMember)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletWorkflow   
    if (storable instanceof PortletWorkflow) {
      PortletWorkflow obj = (PortletWorkflow)storable;
    
      // firstPublications
      remove(obj, obj.getFirstPublications(false), "firstPublications");
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // PortletWYSIWYG   
    if (storable instanceof PortletWYSIWYG) {
      PortletWYSIWYG obj = (PortletWYSIWYG)storable;
    
      // originalPortlet
      remove(obj, obj.getOriginalPortlet(), "originalPortlet");
    }    
    // ArticleMS   
    if (storable instanceof ArticleMS) {
      ArticleMS obj = (ArticleMS)storable;
    
      // relatedContents
      remove(obj, obj.getRelatedContents(false), "relatedContents");
      // tag
      remove(obj, obj.getTag(), "tag");
    }    
    // Tag   
    if (storable instanceof Tag) {
      Tag obj = (Tag)storable;
    
      // url
      remove(obj, obj.getUrl(), "url");
    }    
  }
  
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// RPv6YYObhCSoJJdJ3Q1Zfg==
