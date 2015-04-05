package custom;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.LowerCaseFilter;
import org.apache.lucene.analysis.StopFilter;
import org.apache.lucene.analysis.Token;
import org.apache.lucene.analysis.TokenFilter;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.analysis.standard.StandardFilter;
import org.apache.lucene.analysis.standard.StandardTokenizer;
import org.apache.lucene.document.Document;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.BooleanClause;
import org.apache.lucene.search.BooleanQuery;
import org.apache.lucene.search.DefaultSimilarity;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.Similarity;
import org.apache.lucene.util.Version;

import com.jalios.jcms.Category;
import com.jalios.jcms.Channel;
import com.jalios.jcms.JcmsUtil;
import com.jalios.jcms.Publication;
import com.jalios.jcms.QueryResultSet;
import com.jalios.jcms.handler.AllMemberQueryHandler;
import com.jalios.jcms.handler.QueryHandler;
import com.jalios.jcms.policy.LuceneSearchEnginePolicyFilter;
import com.jalios.jcms.search.LuceneCategorySearchEngine;
import com.jalios.jcms.search.LuceneMemberSearchEngine;
import com.jalios.jcms.search.LucenePublicationSearchEngine;
import com.jalios.util.MailUtil;
import com.jalios.util.Util;
import com.jalios.util.lucene.ApostropheFilter;
import com.jalios.util.lucene.DashFilter;
import com.jalios.util.lucene.ISOLatin1AccentFilter;
import com.jalios.util.lucene.UnderscoreFilter;

import custom.LuceneSearchEnginePolicy.ParseOptions.TextMode;

/**
 * This class contains all possible hooks that can be used by the
 * existing Lucene Search Engines.<br>
 * <br>
 * <b>DO NOT</b> change any method signature.
 * <br>
 * 
 * <li> Analyzer (used when indexing and searching)
 *  <ul>
 *   <li>{@link LuceneSearchEnginePolicyFilter#getAnalyzer(String, boolean, Analyzer)}</li>
 *  </ul>
 *   Possibility to return any Analyzer to integrate linguistic specifity of each language.
 *   Look at examples inside methods.
 * </li>
 * <br>
 * 
 * <li> Modify Lucene Document (used when indexing)
 *  <ul>
 *    <li>{@link LuceneSearchEnginePolicyFilter#filterPublicationDocument(Document, Publication, String)}</li>
 *    <li>{@link LuceneSearchEnginePolicyFilter#filterCategoryDocument(Document, Category, String)}</li>
 *    <li>{@link LuceneSearchEnginePolicyFilter#filterMemberDocument(Document, com.jalios.jcms.Member)}</li>
 *  </ul>
 *  Allow you to modify the lucene Document created by JCMS just before its writing in the index.
 * </li>
 * 
 * <li> Query Parser (used when searching)
 *  <ul>
 *   <li>{@link LuceneSearchEnginePolicy#parse(String, ParseOptions, Analyzer)}</li>
 *   <li>{@link LuceneSearchEnginePolicy.CustomQueryParser}</li>
 *  </ul>
 *   Two custom QueryParser used by the JCMS search engines to build your lucene query
 *   using JCMS {@link QueryHandler} options and/or to disable some features (wildcard, fuzzy)
 *   using JCMS properties.
 * </li>
 * <br>
 * 
 * <li> Score (used when indexing and searching)
 *  <ul>
 *    <li>{@link LuceneSearchEnginePolicy.CustomSimilarity}</li></i>
 *    <li>{@link LuceneSearchEnginePolicy#getSimilarity()}</li></i>
 *  </ul>
 *  Allow you to use a custom scoring implementation.
 *  <ul>
 *    <li>{@link LuceneSearchEnginePolicy#getPublicationNewScore(QueryHandler, QueryResultSet, Category, float, float, Publication, float, float, boolean)}</li>
 *  </ul>
 *  Allow you to change how found categories boost the score of publications at search time.
 * </li>
 * 
 * <b>DO NOT</b> remove any  methods or inner class from this class unless specified, 
 * as it may be used by com.jalios.jcms classes.
 * 
 * @since jcms-5.1
 */
@SuppressWarnings("deprecation")
public class LuceneSearchEnginePolicy {

  protected static final Logger logger = Logger.getLogger(LuceneSearchEnginePolicy.class);
  protected static final Channel channel = Channel.getChannel();
  
  //-----------------------------------------------
  // Analyzer
  //-----------------------------------------------
  
  /**
   * Stopwords.
   * Modify the language properties "query.lucene.stop-words" to change
   * stop words for a given language.
   */
  /** Have stop word been loaded properly from property ? */
  public static boolean stopWordsLoaded = false;
  /** Map of ISO-639 language code to StopWords Set : String lang => HashSet {...stopwords...} */
  public static HashMap<String,HashSet<String>> stopWordsSetMap = new HashMap<String,HashSet<String>>();
  
  /**
   * Read stop words from language properties
   */ 
  synchronized private static void readStopWordsProperties() {
    List<String> siteLanguage = channel.getLanguageList();
    for (Iterator<String> itLang = siteLanguage.iterator(); itLang.hasNext();) {
      String lang = itLang.next();
      // Read stop word properties as HashSet
      String stopWordsStr = JcmsUtil.glp(lang, "query.lucene.stop-words");
      HashSet<String> stopWordsSet = new HashSet<String>(Util.splitToList(stopWordsStr, ","));
      stopWordsSetMap.put(lang, stopWordsSet);
    }
    stopWordsLoaded = true;
  }
  
  /** 
   * Retrieves stop words of the specified language.
   * @param lang a ISO-639 language code
   * @return a Set of stop words String
   */
  public static HashSet<String> getLanguageStopWordsSet(String lang) {
    if (!stopWordsLoaded) {
      readStopWordsProperties();
    }
    HashSet<String> stopWordsSet = Util.isEmpty(lang) ? new HashSet<String>() : stopWordsSetMap.get(lang);
    return Channel.getChannel().getPolicyManager().getLanguageStopWordsSet(lang, stopWordsSet);
  }
  
  /**
   * Filters {@link StandardAnalyzer} with {@link ISOLatin1AccentFilter}.
   * Default Analyzer used internally by JCMS through {@link LuceneSearchEnginePolicyFilter#getAnalyzer(String, boolean, Analyzer)}.
   */
  public static class CustomAnalyzer extends StandardAnalyzer {
    final String lang;
    final boolean isIndexing;
    final HashSet<String> stopWordsSet;
    public CustomAnalyzer(String lang, boolean isIndexing) {
      super(Version.LUCENE_29, getLanguageStopWordsSet(lang));
      this.lang = lang;
      this.isIndexing = isIndexing;
      this.stopWordsSet = getLanguageStopWordsSet(lang);
    }
    
    @Override
    public TokenStream tokenStream(String fieldName, Reader reader) {
      // Fix bug JCMS-3407 : Stop words are not correctly ignored in exact mode when they are preceded with an quote/apostrophe
      // DO NOT use the super implementation 
      //   TokenStream result = super.tokenStream(fieldName, reader);
      // Instead perform a very similar processing, but place the StopFilter at the 
      // end to ensure stop word are removed correctly even after ApostropheFilter  
      
      StandardTokenizer tokenStream = new StandardTokenizer(Version.LUCENE_29, reader);
      tokenStream.setMaxTokenLength(getMaxTokenLength());
      
      TokenStream result = new StandardFilter(tokenStream);
      result = new LowerCaseFilter(result);      
      result = filterTokenStream(fieldName, reader, result);
      result = new StopFilter(false, result, stopWordsSet);
      
      return result;
    }
    
    public TokenStream filterTokenStream(String fieldName, Reader reader, TokenStream tokenStream) {
      // These filter cuts words containing underscore and dash.
      tokenStream = new UnderscoreFilter(tokenStream);
      tokenStream = new DashFilter(tokenStream);
      
      if (isIndexing) {
        // This filter removes removes the pattern "[cdjlmnstCDJLMNST]'" from the start of words.
        tokenStream = new ApostropheFilter(tokenStream);

        // This filter creates unaccented "synonym" for each token (only when indexing)
        tokenStream = new ISOLatin1AccentFilter(tokenStream, isIndexing);
      }
      
      // Debugging Filter to display filtered token
      if (logger.isTraceEnabled()) {
        tokenStream = new LoggingFilter(tokenStream);
      }
      
      // Use this filter to display warning message when the number of token exceed the limit specified by 
      if (TOKEN_NUMBER_LOGGING_THRESHOLD > 0) {
        tokenStream = new TokenNumberLoggingFilter(tokenStream);
      }
      
      return tokenStream;
    }
    
    public HashSet<String> getStopWordsSet() {
      return stopWordsSet;
    }
  }

  static final long TOKEN_NUMBER_LOGGING_THRESHOLD = channel.getLongProperty("query.lucene.token-nbr-logging-threshold", 1000000);
  
  /**
   * TokenFilter used to display a log message if the number of token reach a certain level.
   */
  static class TokenNumberLoggingFilter extends TokenFilter {
    long tokenNumber = 0;
    
    protected TokenNumberLoggingFilter(TokenStream in) {
      super(in);
    }

    @Override
    public Token next() throws IOException {
      Token t = input.next();
      if (t == null) {
        return null;
      }
      tokenNumber++;
      if (tokenNumber == TOKEN_NUMBER_LOGGING_THRESHOLD) {
        logger.info(tokenNumber + " token indexed so far. If this number gets too high and memory is not correctly configured, it might cause an OutOfMemory. You can disable or change the threshold of this message by modifying property 'query.lucene.token-nbr-logging-threshold'");
      }
      return t;
    }
    
    @Override
    public void close() throws IOException {
      super.close();
    }
    
    @Override
    public void reset() throws IOException {
      super.reset();
      tokenNumber = 0;
    }
  }
    
  /**
   * TokenFilter used for debugging purpose to display all tokened indexed
   */
  public static class LoggingFilter extends TokenFilter {

    public LoggingFilter(TokenStream in) {
      super(in);
    }

    @Override
    public Token next() throws IOException {
      Token t = input.next();

      if (t == null) {
        return null;
      }
      logger.trace(" token: " + t);
      return t;
    }
  }
  
  //-----------------------------------------------
  // QueryParser
  //-----------------------------------------------

  public static final String[] LUCENE_SPECIAL_CHARS = new String[] {
    "+", "-", "&&", "||", "!", "(", ")", "{", "}",
    "[", "]", "^", "\"", "~", "*", "?", ":", "\\" };
  
  public static final boolean USE_RIGHT_TRUNCATION = channel.getBooleanProperty("query.lucene.use-right-truncation", false);
  
  /**
   * A string containing all characters which are used to split user's search strings before right truncation is applied.<p>
   * Default characters includes :
   * <ul> 
   *  <li> underscore : "ABC_DEF" => "ABC DEF", but "GHI_42" is also split to "GHI 42" (like we do in UnderscoreFilter) </li>
   *  <li> dash : "ABC-DEF" => "ABC DEF", but "GHI-42" is also split to "GHI 42" (like we do in DashFilter) </li>
   *  <li> colon : "ABC:DEF" => "ABC DEF" (bug JCMS-2060) </li>
   *  <li> degree sign : "ABC°DEF" => "ABC DEF" (bug JCMS-3243) </li>
   * </ul>
   * The objective of this string is to match indexing lucene behavior at search time.
   */
  public static final String RIGHT_TRUNCATION_SPLIT_CHARS = channel.getProperty("query.lucene.right-truncation.split-chars", "_-:°");
  
  /**
   * A regular expression used to match words in user's search string for which right truncation will NOT be applied.<p>
   * Default regex applies to :   
   * <ul> 
   *  <li> punctuation... </li>
   *  <li> words ending with punctuation (for example "said" and "world" in : "john said: hello world!") </li>
   *  <li> numbers, as we want to match them precisely (it also prevents TooManyBoolean with big index) </li>
   * </ul>
   */
  public static final String RIGHT_TRUNCATION_EXCLUSION_REGEX = channel.getProperty("query.lucene.right-truncation.exclusion-regex", "^(.*\\p{Punct})|(\\d+)$");    

  /**
   * Invoked by JCMS Lucene search engines to parse query.
   * 
   * @param searchString the string to search/parse
   * @param options a SearchOptions instance holder of search parameters
   * @param analyzer the Analyzer instance being used to perform the query
   * 
   * @return a new Query instance
   * @throws ParseException if lucene query was invalid
   * @since jcms-6.1.0
   */
  public static Query parse(String searchString, ParseOptions options, Analyzer analyzer) throws ParseException {
    // Define default boolean operator to use for parsing
    QueryParser.Operator operator = QueryParser.AND_OPERATOR;
    if (options.getMode() == TextMode.ANY_WORD) { // Any mode is the only one to use the OR operator 
      operator = QueryParser.OR_OPERATOR;
    }
    // Retrieve the searchString converted
    String modifiedSearchString = getSearchString(searchString, options, analyzer);
    if (logger.isDebugEnabled()) {
      logger.debug("Modified SearchString : '" + modifiedSearchString + "' (was : '" + searchString + "'");
    }

    // Build the MultiField query
    BooleanQuery multiFieldQuery = new BooleanQuery();
    for (String field : options.getFields()) {
      QueryParser parser = new CustomQueryParser(field, analyzer);
      parser.setDefaultOperator(operator);
      Query fieldQuery = parser.parse(modifiedSearchString);
      fieldQuery.setBoost(getFieldBoost(options, field));
      // return optimized single query version when there is only one field
      if (options.getFields().length == 1) {
        return fieldQuery;
      }
      multiFieldQuery.add(fieldQuery, BooleanClause.Occur.SHOULD);
      
    }
    return multiFieldQuery;
  }
  
  /**
   * Return the boost that should be apply to a field at query time for text search.
   * 
   * @param options a SearchOptions instance holder of search parameters
   * @param fieldName the field name being search and for which a Query object is being built
   * @return a float noting the boost value of the field to apply to the Query object
   * @since jcms-8.0.0
   */
  public static float getFieldBoost(ParseOptions options, String fieldName) {
    switch (options.getEngine()) {
      
      case PUBLICATION: {
        if (fieldName.equals(LucenePublicationSearchEngine.TITLE_FIELD)) {
          return 2.0f;
        } else if (fieldName.equals(LucenePublicationSearchEngine.ABSTRACT_FIELD)){
          return 1.3f;
        } else if (fieldName.equals(LucenePublicationSearchEngine.ALLFIELDS_FIELD)){
          return 1.0f;
        } else if (fieldName.equals(LucenePublicationSearchEngine.FILEDOCUMENT_CONTENT)) {
          return 1.0f;
        }
        return 1.0f;
      }
      
      case CATEGORY: {
        if (fieldName.equals(LuceneCategorySearchEngine.NAME_FIELD)) {
          return 1.2f;
        } else if (fieldName.equals(LuceneCategorySearchEngine.SYNONYMS_FIELD)){
          return 1.1f;
        } else if (fieldName.equals(LuceneCategorySearchEngine.ALLFIELDS_FIELD)){
          return 1.0f;
        }
        return 1.0f; 
      }
      
      case MEMBER: {
        if (fieldName.equals(LuceneMemberSearchEngine.ALLFIELDS_FIELD)) {
          return 1.0f;
        }       
        return 1.0f; 
      }
      
      default:
        return 1.0f; 
    }
  }

  /**
   * Compute the search string to use from the specified options
   * @param searchString the string to search
   * @param options the SearchOption
   * @param analyzer the current analyzer being used for the search
   * @return a String modified to be suitable for lucene search.
   */
  public static String getSearchString(String searchString, ParseOptions options, Analyzer analyzer) {
    switch (options.getMode()) {
      case EXACT:
        // For EXACT phrase search,
        // escape lucene special chars and surround with quote to find an exact match.
        return "\"" + Util.escapeLuceneQuery(cleanSearchString(searchString)) + "\"";

      case ALL_WORDS:
      case ANY_WORD:
        // For ALL or ANY mode, 
        // escape lucene special chars and apply right truncation if requested.
        // The difference between ALL and ANY is in the boolean operator used after this method.
        if (!USE_RIGHT_TRUNCATION) {
          return Util.escapeLuceneQuery(cleanSearchString(searchString));
        }
        return getSearchStringWithRightTruncation(cleanSearchString(searchString), options, analyzer);

      case ADVANCED:
      default:
        // For ADVANCED mode (default mode when no special mode has been specified)
        // Leave search string untouch, as this is the user who deal with everything
        // (no right truncation)
        return searchString;
    }
  }

  /**
   * Perfom common cleanup that should be applied to all languages and all search mode (excepted advanced mode).
   * @param searchString the text entered by the user
   */
  protected static String cleanSearchString(String searchString) {
    // When right truncation is applied, the tokenStream method of the Analyzer is not invoked by the QueryParser
    // Consequence : no filter is applied.
    // Solution : perform all the work that is usually performed by the various filters of the analyzer

    // 1. StandardAnalyzer
    // StandardFilter : Remove quote-s ('s), usually in english, but so common apply it for all languages
    searchString = searchString.replaceAll("['’]s(\\s|$)", "$1");
    // LowerCaseFilter : lowercase all words
    searchString = searchString.toLowerCase();

    // 2. CustomAnalyzer
    // ApostropheFilter : remove apostrophe
    searchString = searchString.replaceAll("(^|\\s)[cdjlmnstCDJLMNST]['’]", "$1");
    // ISOLatin1AccentFilter : unaccent
    searchString = ISOLatin1AccentFilter.removeAccents(searchString);

    return searchString;
  }

  /**
   * Apply Right truncation to the given search string and return the
   * new search string to use.
   */
  protected static String getSearchStringWithRightTruncation(String searchString, ParseOptions options, Analyzer analyzer) {
    // JCMS-4149 : No split nor right truncation when searching for an email
    if (MailUtil.checkEmail(searchString)) {
      return searchString;
    }
    
    List<String> wordList = Util.splitToList(searchString, " " + RIGHT_TRUNCATION_SPLIT_CHARS);

    // Remove stop words before applying right truncation transformation
    if (analyzer instanceof CustomAnalyzer) {
      CustomAnalyzer can = (CustomAnalyzer) analyzer;
      HashSet<String> stopWordsSet = can.getStopWordsSet();
      if (Util.notEmpty(stopWordsSet)) {
        for (Iterator<String> it = wordList.iterator(); it.hasNext();) {
          String itWord = it.next();
          if (stopWordsSet.contains(itWord)) {
            it.remove();
          }
        }
      }
      // Make sure we do not return an empty string
      // if all the words of the query are stop words
      if (Util.isEmpty(wordList)) {
        wordList = Util.splitToList(searchString, " " + RIGHT_TRUNCATION_SPLIT_CHARS);
      }
    }
    
    // Escape each word in the word List
    // and apply right truncation to the eligible words
    List<String> finalWordList = new ArrayList<String>();
    for (String word : wordList) {
      // Do not use right truncation for word matching the exclusion pattern
      boolean useRT = !word.matches(RIGHT_TRUNCATION_EXCLUSION_REGEX);
      word = Util.escapeLuceneQuery(word);
      if (useRT) {
        word += "*";
      }
      finalWordList.add(word);
    }

    // Build new phrase
    return Util.join(finalWordList, " ");
  }
  
  /**
   * Holder class for text search options
   * @since jcms-6.1.0
   */
  public static class ParseOptions {
    
    TextMode mode = TextMode.ANY_WORD;
    String[] fields = new String[] {};
    Engine engine;

    /**
     * Build a new SearchOptions from the specified QueryHandler
     * @param fields the fields in which search should be performed
     * @param qh the QueryHandler from which options should be retrieved
     * @param engine the search engine for which the search is being performed 
     * @since jcms-8.0.0
     */
    public ParseOptions(String[] fields, QueryHandler qh, Engine engine) {
      this(fields);
      if (QueryHandler.TEXT_MODE_ALL_WORDS.equals(qh.getMode())) {
        this.mode = TextMode.ALL_WORDS;
      } else if (QueryHandler.TEXT_MODE_ANY_WORD.equals(qh.getMode())) {
        this.mode = TextMode.ANY_WORD;
      } else if (QueryHandler.TEXT_MODE_EXACT.equals(qh.getMode())) {
        this.mode = TextMode.EXACT;
      } else if (QueryHandler.TEXT_MODE_ADVANCED.equals(qh.getMode())) {
        this.mode = TextMode.ADVANCED;
      } else {
        this.mode = TextMode.ALL_WORDS; // default
      }
      this.engine = engine;
    }

    /**
     * Build a new SearchOptions from the specified AllMemberQueryHandler
     * @param fields the fields in which search should be performed
     * @param amqh the QueryHandler from which options should be retrieved
     * @since jcms-6.1.0
     */
    public ParseOptions(String[] fields, AllMemberQueryHandler amqh) {
      this(fields);
      this.mode = TextMode.ALL_WORDS;
      this.engine = Engine.MEMBER;
    }
    
    protected ParseOptions(String[] fields) {
      if (fields != null) {
        this.fields = fields;
      }
    }
    
    public static enum TextMode {
      /**
       * The mode value to use to perform a text search
       * matching <b>all</b> the words of the search string.<br>
       * @since jcms-6.1.0
       */
      ALL_WORDS,
      /**
       * The mode value to use to perform a text search
       * matching <b>at least one</b> of the words of the search string.<br>
       * @since jcms-6.1.0
       */
      ANY_WORD,
      /**
       * The mode value to use to perform a text search
       * matching the <b>exact phrase</b> specified in the search string.<br>
       * @since jcms-6.1.0
       */
      EXACT,
      /**
       * The mode value to use to perform a text search
       * with <b>advanced search syntax</b> (wildcard, field, etc).<br>
       * @since jcms-6.1.0
       */
      ADVANCED      
    }
    
    /**
     * Retrieve the TextMode to use during the text search
     * @return a TextMode
     * @since jcms-6.1.0
     */
    public TextMode getMode() {
      return mode;
    }
    
    /**
     * Retrieve the lucene fields in which to perform the search
     * @return an array of lucene fields name
     * @since jcms-6.1.0
     */
    public String[] getFields() {
      return fields;
    }
    
    /**
     * Search engine for which an operation is requested.
     * @since jcms-8.0.0
     */
    public static enum Engine {
      /** LucenePublicationSearchEngine */
      PUBLICATION,
      /** LuceneMemberSearchEngine */
      MEMBER,
      /** LuceneCategorySearchEngine */
      CATEGORY
    };

    /**
     * Retrieve the Engine for which the search operation was requested.
     * @return a Engine
     * @since jcms-8.0.0
     */
    public Engine getEngine() {
      return engine;
    }
  }

  /**
   * This custom QueryParser is used by the CustomMultiFieldQueryParser.
   * You can modify it in order to add or remove your own features.
   * For example you can disable wildcard or fuzzy search.
   * @since jcms-5.5.0
   */
  public static class CustomQueryParser extends QueryParser {
    public static final boolean LUCENE_WILDCARD_ENABLED = channel.getBooleanProperty("query.lucene.wildcard.enabled", true);
    public static final boolean LUCENE_FUZZY_ENABLED = channel.getBooleanProperty("query.lucene.fuzzy.enabled", true);

    /**
     * Builds a new CustomQueryParser.
     * @param field the field being searched
     * @param analyzer the Analyzer to use for the search
     */
    public CustomQueryParser(String field, Analyzer analyzer) {
      super(field, analyzer);
    }
    
    /** Disable wildcard query. */
    @Override
    protected Query getWildcardQuery(String field, String termStr)
        throws ParseException {
      if (!LUCENE_WILDCARD_ENABLED) {
        throw new ParseException("Wildcard Query not allowed");
      }
      return super.getWildcardQuery(field, termStr);
    }
    
    /** Disable fuzzy query. */
    @Override
    protected Query getFuzzyQuery(String field, String termStr, float minSimilarity)
        throws ParseException {
      if (!LUCENE_FUZZY_ENABLED) {
        throw new ParseException("Fuzzy Query not allowed");
      }
      return super.getFuzzyQuery(field, termStr, minSimilarity);
    }
  }
  
  //-----------------------------------------------
  // Search
  //-----------------------------------------------

  /** Custom scoring implementation. */
  public static class CustomSimilarity extends DefaultSimilarity {
    /**
     * We do not want long text to be less important than short text.
     * Therefore always return 1 for this normalization value to have no impact.
     * 
     * This value is computed during indexing and stored in the index.
     */
    @Override
    public float lengthNorm(String fieldName, int numToken) {
      return 1;
    } 
    
    /**
     * In JCMS, document fields are used for title/abstract/allfield, but contrary
     * to the default behavior of Lucene similarity, if a match occured in several
     * of those field as compared to only one, it should not change the score.
     * <p>
     * Indeed, the field boost already takes care of the higher relevance of title vs abstract vs other.
     */
    @Override
    public float coord(int overlap, int maxOverlap) {
      return 1;
    }
  }

  /** The Similarity implementation used by default. */
  private static Similarity defaultImpl = new CustomSimilarity();
  
  /**
   * Returns the Similarity implementation to be used by Searcher of LuceneDataSearchEngine.
   * By default the CustomSimilarity implementation is returned.
   * @return the Similarity instance to use in JCMS Lucene indexing/search
   */
  public static Similarity getSimilarity() {
    return defaultImpl;
  }
  
  /**
   * This method is called by the LuceneCategorySearchEngine when searching full text
   * in category, it is used to compute the new score of the Publication (previously
   * found or not by the LucenePublicationSearchEngine).
   * 
   * 
   * @param qh the QueryHandler that was used for this search.
   * @param resultSet the QueryResultSet currently computed.
   * 
   * @param cat the Category found.
   * @param catScore the lucene score of the Category.
   * @param maxCatScore the highest category score
   *        (does not change during all calls to this method in a same query).
   *        
   * @param pub the Publication that will be added/replaced in 
   *        the resultSet with the returned score.
   * @param pubScore the score already available for this publication
   *        (0.0f if <code>isNewResult</code> is false).
   * @param maxPubScore the highest publication score
   *        (does not change during all calls to this method in a same query).
   *        
   * @param isNewResult if true, the given publication was found for the
   *        first time by searching in this category, otherwise the given publication
   *        had already been added (through text search in publications or with a
   *        previous category).
   *        
   * @return the new score of the Publication
   */
  public static float getPublicationNewScore(QueryHandler qh, QueryResultSet resultSet,
                                             Category cat, float catScore, float maxCatScore,
                                             Publication pub, float pubScore, float maxPubScore,
                                             boolean isNewResult) {
    // default Publication's score for new result
    // use the category score applied in range of the publication score
    if (isNewResult) {
      return (catScore / maxCatScore) * maxPubScore;
    }
    
    // We want every publication also found through category to have a score
    // higher than the best publication score, but we also want to keep the
    // difference of score between each results
    
    // We use the serie 1 /(2^n) which converge to 1 in order to add a score
    // without vanishing the previous score.
    // 
    // ==> 2 - pubScore > 1 / (2^n)
    // ==> ln(2 - pubScore) / ln(2) > -n
    // ==> n > - ( ln(2 - pubScore) / ln(2))
    double n = 1 + ((Math.log( (1+maxPubScore) - pubScore)) / Math.log(2));
    float newScore = (float) (Math.max(maxPubScore, pubScore) + (catScore * (1 / Math.pow(2, n))));
    return newScore;
  }
}
