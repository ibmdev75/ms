// This file has been automatically generated.
// Generation date : Wed Jan 28 18:44:11 CET 2015
   
package generated;
import java.util.*;
import org.apache.oro.text.regex.Pattern;
import org.apache.oro.text.regex.Perl5Compiler;
import org.apache.oro.text.regex.Perl5Matcher;
import org.hibernate.Hibernate;
import com.jalios.jcms.*;
import com.jalios.jcms.db.*;
import com.jalios.jcms.mashup.*;
import com.jalios.util.*;
@SuppressWarnings({"unchecked", "unused"})
public  class GlossaryEntry extends com.jalios.jcms.Content 
             implements 
                com.jalios.jstore.Searchable
               , TreeNode
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public GlossaryEntry() {}
 
 
 
  
  
  
  public GlossaryEntry(GlossaryEntry other) {
    super(other);
    definition = other.definition;
    definitionML = other.definitionML;
    seeAlso = other.seeAlso;
    glossary = other.glossary;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
      setDefinition(ImportUtil.parseFieldText(elt, "definition"));
      setDefinitionML(ImportUtil.parseFieldTextML(elt, "definitionML"));
      setSeeAlso(ImportUtil.parseSelfFieldDataArray(elt, "seeAlso", generated.GlossaryEntry.class));
      setGlossary(ImportUtil.parseSelfFieldData(elt, "glossary", generated.Glossary.class));
    } else {
    
    setDefinitionML(ImportUtil.parseFieldWikiML(elt, "definitionML"));
    setDefinition(ImportUtil.parseFieldWiki(elt, "definition"));
    setSeeAlso((generated.GlossaryEntry[])ImportUtil.parseFieldDataArray(elt, "seeAlso", generated.GlossaryEntry.class));
    setGlossary((generated.Glossary)ImportUtil.parseFieldData(elt, "glossary"));
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "definition", getDefinition(), "definitionML", true, true));
    sb.append(ExportUtil.exportField(indentLevel, "definitionML", getDefinitionML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "seeAlso", getSeeAlso()));
    sb.append(ExportUtil.exportField(indentLevel, "glossary", getGlossary()));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>GlossaryEntry</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(GlossaryEntry.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>GlossaryEntry</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>GlossaryEntry</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>GlossaryEntry</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(GlossaryEntry.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>GlossaryEntry</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>GlossaryEntry</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>GlossaryEntry</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(GlossaryEntry.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>GlossaryEntry</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>GlossaryEntry</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>GlossaryEntry</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>GlossaryEntry</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>GlossaryEntry</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>GlossaryEntry</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>GlossaryEntry</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>GlossaryEntry</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
    super.setBooleanFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>Category</code> field name for the current <code>Data</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param mbr the member used to check rigth access to categories.
   * @return a <code>TreeSet</code> of <code>Category</code>
   * @throws NoSuchFieldException if the field was not found in the given <code>Data</code>.
   */
  public TreeSet getCategoryFieldValue(String fieldName, Member mbr) throws NoSuchFieldException {
    return super.getCategoryFieldValue(fieldName, mbr);
  }
  /**
   * Gets the <code>Object</code> value of the given field name for this <code>GlossaryEntry</code>. <br>
   * Do not retrieve <code>Category</code> fields, see {@link #getCategoryFieldValue(String, Member)}.
   * @param fieldName the field name from which to retrieve the field value.
   * @param lang the language (ISO-639 code) in which to retrieve the field value
   *        (used only for multilingual fields).
   * @param useDefault whether to use the publication main language if the field value 
   *        is not available in the requested language (used only for multilingual fields).
   * @return the <code>Object</code> field value
   * @throws NoSuchFieldException if the field was not found in the given <code>Publication</code>.
   */
  public Object getFieldValue(String fieldName, String lang, boolean useDefault) throws NoSuchFieldException {
    if ("definition".equals(fieldName)) { return getDefinition(lang, useDefault); }
    if ("seeAlso".equals(fieldName)) { return getSeeAlso(); }
    if ("glossary".equals(fieldName)) { return getGlossary(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>GlossaryEntry</code>. <br>
   * Do not set <code>Category</code> fields, see {@link #setCategoryFieldValue(String, TreeSet)}.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>Object</code> field value
   * @param lang the language (ISO-639 code) in which to retrieve the field value
   *        (used only for multilingual fields).
   * 
   * @throws NoSuchFieldException if the field was not found in the given <code>Publication</code>.
   * @since jcms-6.3.0 
   */
  public void setFieldValue(String fieldName, Object value, String lang) throws NoSuchFieldException {
    if ("definition".equals(fieldName)) { setDefinition(lang,(String)value); return; }
    if ("seeAlso".equals(fieldName)) { setSeeAlso((generated.GlossaryEntry[])value); return; }
    if ("glossary".equals(fieldName)) { setGlossary((generated.Glossary)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // definition
  // ----------------------------------------------------------------------  
  protected  String definition = channel.getTypeFieldEntry(GlossaryEntry.class, "definition", true).getDefaultTextString();
  public String getDefinition() { return definition; }
  public void setDefinition(String v) { definition = v; }
  
  
  protected HashMap definitionML = channel.getTypeFieldEntry(GlossaryEntry.class, "definition", true).getDefaultTextMap();
  public String getDefinition(String lang) { return (String)channel.getLangValue(lang, true, definition, definitionML, getMainLanguage()); }
  public String getDefinition(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, definition, definitionML, getMainLanguage()); }
  public HashMap getDefinitionML() { return definitionML; }
  public void setDefinitionML(HashMap v) { definitionML = v; }
  /**
   * Convenient method to set the value of the Definition field
   * in any language (default site language or any other).<br>
   * This method will set the proper field value
   * ({@link #setDefinition(String)} or {@link #setDefinitionML(HashMap)})
   * depending on the specified language.
   * 
   * @param lang the language (ISO 639 code) in which to set the value
   * @param value the value to set.
   * @since jcms-5.7
   */
  public void setDefinition(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      definition = value;
      return;
    }
    if (definitionML == null) {
      definitionML = new HashMap();
    } else if (this != channel.getData(id)) {
      definitionML = new HashMap<String,String>(definitionML);
    }
    definitionML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // seeAlso
  // ----------------------------------------------------------------------  
  protected  generated.GlossaryEntry[] seeAlso;
  public generated.GlossaryEntry[] getSeeAlso() { return seeAlso; }
  public void setSeeAlso(generated.GlossaryEntry[] v) { seeAlso = v; }
  
  
  // ----------------------------------------------------------------------
  // glossary
  // ----------------------------------------------------------------------  
  protected  generated.Glossary glossary;
  public generated.Glossary getGlossary() { return glossary; }
  public void setGlossary(generated.Glossary v) { glossary = v; }
  
  
   
  // ----------------------------------------------------------------------
  // abstract
  // ----------------------------------------------------------------------  
  @Override
  public void setAbstract(String lang, String value) { setDefinition(lang, value); }
  @Override
  public String getAbstract() { return definition; }
  @Override
  public String getAbstract(String lang, boolean useDefault) { return getDefinition(lang, useDefault); }
  @Override
  public HashMap<String,String> getAbstractML() { return getDefinitionML(); }
  public String[] getSearchStrings() {
    StringBuffer sb = new StringBuffer(super.getSearchStrings()[0]);
    sb.ensureCapacity(500 * (0 + 2 + 0 + 0) );
    if (definition != null) {
      sb.append(definition); sb.append(' '); 
    }
    if (definitionML != null) {
      for(Iterator it = definitionML.values().iterator(); it.hasNext();) {
        Object obj = it.next();
        if (obj != null) {
          sb.append(obj); sb.append(' ');
        }
      }
    }
    if (title != null) {
      sb.append(title); sb.append(' '); 
    }
    if (titleML != null) {
      for(Iterator it = titleML.values().iterator(); it.hasNext();) {
        Object obj = it.next();
        if (obj != null) {
          sb.append(obj); sb.append(' ');
        }
      }
    }
    return new String[] {sb.toString()};
  }
  
  public String getAllWikiText() {
    StringBuffer sb = new StringBuffer(super.getAllWikiText());
    sb.ensureCapacity(500 * (0 + 1 + 0 + 0) );
    if (definition != null) {
      sb.append(definition); sb.append(' '); 
    }
    if (definitionML != null) {
      for(Iterator it = definitionML.values().iterator(); it.hasNext();) {
        Object obj = it.next();
        if (obj != null) {
          sb.append(obj); sb.append(' ');
        }
      }
    }
    return sb.toString();
  }
  
  public String getAllWysiwygText() {
    StringBuffer sb = new StringBuffer(super.getAllWysiwygText());
    sb.ensureCapacity(500 * (0 + 0 + 0 + 0) );
    return sb.toString();
  }
  
  public TreeSet getLinkDataSet(Class clazz) {
    if (clazz == null) {
      return Util.EMPTY_TREESET;
    }
    TreeSet set = new TreeSet();
    JcmsUtil.addData(set, clazz, getGlossary());
    JcmsUtil.addData(set, clazz, getSeeAlso());
    return set;
  }
  
  // ----------------------------------------------------------------------
  // TreeNode implementation
  // ----------------------------------------------------------------------
  public Collection getTreeChildren() {
    return Util.EMPTY_TREESET;
  }
  
  public TreeNode getTreeParent() {
    return getGlossary();
  }
  // ----------------------------------------------------------------------
  // DataController
  // ----------------------------------------------------------------------  
  public ControllerStatus checkIntegrity() {
    
    ControllerStatus status = super.checkIntegrity();
    if (status.hasFailed()) {
      return status;
    }
    
    return ControllerStatus.OK;
  }
  
  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------  
  protected Publication prepareMergeCopy() {
    GlossaryEntry copy = (GlossaryEntry)super.prepareMergeCopy();
    GlossaryEntry main = (GlossaryEntry)mainInstance;
    JcmsUtil.mergeMLMap(copy.getDefinitionML(), main.getDefinitionML());
    return copy;
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// rT8t/xW3o+/+eXt8yOBZ3A==
