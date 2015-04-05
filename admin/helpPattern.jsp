<%--
  @Summary: Display help about patterns
  @Category: Admin / Types
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-3.0
--%>
<%@ include file='/jcore/doInitPage.jspf' %>

<% 
  request.setAttribute("title","Pattern help"); 
  request.setAttribute("zone","InternalUI");
%>
<%@ include file='/jcore/doEmptyHeader.jspf' %>
<div style="margin: 10px;">
<p class="t1">How to use Patterns ?</p>

Patterns are intended to limit the kind of characters accepted in a field. 

<p class="t2">Example of patterns</p>

<table class='layout'>
  <tr bgcolor="#CCCCCC">
    <td>&nbsp;</td>
    <td>Example</td>
    <td>Pattern</td>
  </tr>

  <tr bgcolor="#FFFFFF">
   <td><b>Phone number (FR)</b></td>
   <td>01 45 18 39 20</td> 
   <td>\d\d \d\d \d\d \d\d \d\d</td>
  </td>

  <tr bgcolor="#FFFFFF">
    <td><b>Currency (UK)</b></td>
    <td>33 000 700,00</td>
    <td>[\d ]+,\d\d</td>
  </tr>

  <tr bgcolor="#FFFFFF">
    <td><b>Currency (FR)</b></td>
    <td>33 000 700.00</td>
    <td>[\d ]+\.\d\d</td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td><b>A zip code (UK)</b></td>
    <td>NG159HP</td>
    <td>[A-Z]+\d+[A-Z]+</td>
  </tr>

  <tr bgcolor="#FFFFFF">
    <td><b>A zip code (FR)</b></td>
    <td>75015</td>
    <td>\d{5}</td>
  </td>
</table>



<p class="t1">Pattern Syntax</p>
JCMS patterns are based on Perl 5 regular expressions. It is beyond the
scope of this help to give a detailed explanation of regular
expressions to beginners. 
Here we summarize the syntax of Perl5 regular expressions, all of which
is supported by JCMS.  However, for
a definitive reference, you should consult the 
<a href="http://www.perl.org/CPAN/doc/manual/html/pod/perlre.html">
<code>perlre</code> man page </a>
that accompanies the Perl5 distribution and also the book
<em> Programming Perl, 2nd Edition </em> from O'Reilly & Associates.
We need to point out here that for efficiency reasons the character
set operator [...] is limited to work on only ASCII characters
(Unicode characters 0 through 255).  Other than that restriction, all
Unicode characters should be useable in the package's regular expressions.

<p>
<ul>
<li> Alternatives separated by |
<li> Quantified atoms
 <dl compact>
      <dt> {n,m} <dd> Match at least n but not more than m times.
      <dt> {n,}  <dd> Match at least n times.
      <dt> {n}   <dd> Match exactly n times.  
      <dt> *     <dd> Match 0 or more times.
      <dt> +     <dd> Match 1 or more times.
      <dt> ?     <dd> Match 0 or 1 times.
 </dl>
 <li> Atoms
 <ul>
     <li> regular expression within parentheses
     <li> a . matches everything except \n
     <li> a ^ is a null token matching the beginning of a string or line
          (i.e., the position right after a newline or right before
           the beginning of a string)
     <li> a $ is a null token matching the end of a string or line
          (i.e., the position right before a newline or right after
           the end of a string)
     <li> Character classes (e.g., [abcd]) and ranges (e.g. [a-z])
     <ul>
         <li> Special backslashed characters work within a character
              class (except for boundaries).  
         <li> \b is backspace inside a character class
     </ul>
     <li> Special backslashed characters
     <dl compact>
         <dt> \b <dd> null token matching a word boundary (\w on one side
                      and \W on the other)
         <dt> \B <dd> null token matching a boundary that isn't a
                      word boundary
	 <dt> \A <dd> Match only at beginning of string
         <dt> \Z <dd> Match only at end of string (or before newline
                      at the end)
	 <dt> \n <dd> newline
         <dt> \r <dd> carriage return
         <dt> \t <dd> tab
         <dt> \f <dd> formfeed
         <dt> \d <dd> digit [0-9]
         <dt> \D <dd> non-digit [^0-9]
         <dt> \w <dd> word character [0-9a-z_A-Z]
         <dt> \W <dd> a non-word character [^0-9a-z_A-Z]
         <dt> \s <dd> a whitespace character [ \t\n\r\f]
         <dt> \S <dd> a non-whitespace character [^ \t\n\r\f]
         <dt> \xnn <dd> hexadecimal representation of character
         <dt> \cD <dd> matches the corresponding control character
         <dt> \0 <dd> matches null character
         <dt> Any other backslashed character matches itself
     </dl>
 </ul>
 <li> Expressions within parentheses are matched as subpattern groups
      and saved for use by certain methods.
 </ul>

<p>
By default, a quantified subpattern is <em> greedy </em>.
In other words it matches as many times as possible without causing
the rest of the pattern not to match. To change the quantifiers
to match the minimum number of times possible, without
causing the rest of the pattern not to match, you may use
a "?" right after the quantifier.

<dl compact>
<dt> *?     <dd> Match 0 or more times
<dt> +?     <dd> Match 1 or more times
<dt> ??     <dd> Match 0 or 1 time
<dt> {n}?   <dd> Match exactly n times
<dt> {n,}?  <dd> Match at least n times
<dt> {n,m}? <dd> Match at least n but not more than m times
</dl>

<p>
<b> Perl5 extended regular expressions </b> are fully supported.

<dl compact>
<dt> (?#text) <dd> An embedded comment causing text to be ignored.
<dt> (?:regexp) <dd> Groups things like "()" but doesn't cause the
 group match to be saved.
<dt> (?=regexp) <dd>
                 A zero-width positive lookahead assertion.  For
                 example, \w+(?=\s) matches a word followed by
                 whitespace, without including whitespace in the
		 MatchResult.

<dt> (?!regexp) <dd>
                 A zero-width negative lookahead assertion.  For
                 example foo(?!bar) matches any occurrence of
                 "foo" that isn't followed by "bar".  Remember
		 that this is a zero-width assertion, which means
		 that a(?!b)d will match ad because a is followed
		 by a character that is not b (the d) and a d
		 follows the zero-width assertion.


<dt> (?imsx) <dd> One or more embedded pattern-match modifiers.
		i enables case insensitivity, m enables multiline
		treatment of the input, s enables single line treatment
		of the input, and x enables extended whitespace comments.
</ul>
</p>
  </div>
<%@ include file='/jcore/doEmptyFooter.jspf' %>