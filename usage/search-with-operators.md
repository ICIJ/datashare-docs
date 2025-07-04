---
description: To make your searches more precise, use operators in the main search bar.
---

# Search with operators or Regex

### Double quotes for e**xact phrase**

To have all documents mentioning an exact phrase, you can use double quotes. **Use straight double quotes ("example"), not curly double quotes (“example”).**

> "Alicia Martinez’s bank account in Portugal"

### **OR (or space)**

To have all documents mentioning at least one of the queried terms, you can use a simple space between your queries (as OR is the default operator in Datashare) or <kbd>OR</kbd> . You need to write <kbd>OR</kbd> with **all letters uppercase**.

> Alicia Martinez
>
> Alicia OR Martinez

### **AND (or +)**

To have all documents mentioning all the queried terms, you can use <kbd>AND</kbd> between your queried words. You need to write <kbd>AND</kbd> with **all letters uppercase**.

> Alicia AND Martinez
>
> +Alicia +Martinez

### **NOT (or ! or -)**

To have all documents <kbd>NOT</kbd> mentioning some queried terms, you can use <kbd>NOT</kbd> before each word you don't want. You need to write <kbd>NOT</kbd> with **all letters uppercase**.

> NOT Martinez
>
> !Martinez
>
> -Martinez

### **Combine operators**

Parentheses should be used whenever multiple operators are used together and you want to give priority to some.

> ((Alicia AND Martinez) OR (Delaware AND Pekin) OR Grey) AND NOT "parking lot"

You can also combine these with regular expressions (regex) between two slashes ([see below](search-with-operators.md#regular-expressions-regex)).

### **Wildcards**

If you search faithf<kbd>?</kbd>l, the search engine will look for all words with all possible single character between the second f and the l in this word. It also works with <kbd>\*</kbd> to replace multiple characters.

> Alicia Martin?z
>
> Alicia Mar\*z

### **Fuzziness**

You can set fuzziness to 1 or 2. It corresponds to the maximum number of operations (insertions, deletions, substitutions and transpositions) on **characters** needed to make one **term** match the other.

> kitten -> sitten (1 substitution (k turned into s) = fuzziness is 1)

> kitten -> sittin (2 substitutions (k turned into s and e turned into i) = fuzziness is 2)

If you search for similar terms (**to catch typos for example**), you can use fuzziness. Use the [tilde symbol](https://en.wikipedia.org/wiki/Tilde) at the end of the word to set the fuzziness to 1 or 2.

"_The default edit distance is 2, but an edit distance of 1 should be sufficient to catch 80% of all human misspellings. It can be specified as: quikc\~1_" (source: [Elastic](https://www.elastic.co/guide/en/elasticsearch/reference/7.0/query-dsl-query-string-query.html#_fuzziness)).

> quikc\~ brwn\~ foks\~ (as the default edit distance is 2, this query will catch all quick, quack, quock, uqikc, etc. as well as brown, folks, etc.)
>
> Datashare\~1 (this query will catch Datasahre, Dqtashare, etc.)

### **Proximity searches**

When you type an exact phrase (in double quotes) and use fuzziness, then the meaning of the fuzziness changes. Now, the fuzziness means the maximum number of operations (insertions, deletions, substitutions and transpositions) on **terms** needed to make one **phrase** match the other.

Examples:

> "the cat is blue" -> "the small cat is blue" (1 insertion = fuzziness is 1)

> "the cat is blue" -> "the small is cat blue" (1 insertion + 2 transpositions = fuzziness is 3)

"_While a phrase query (eg "john smith") expects all of the terms in exactly the same order, a proximity query allows the specified words to be further apart or in a different order. A proximity search allows us to specify a maximum edit distance of words in a phrase._" (source: [Elastic](https://www.elastic.co/guide/en/elasticsearch/reference/7.0/query-dsl-query-string-query.html#_fuzziness)).

> "fox quick"\~5 (this query will catch "quick brown fox", "quick brown car thin fox" or even "quick brown car thin blue tree fox"

The closer the text in a field is to the original order specified in the query string, the more relevant that document is considered to be. When compared to the above example query, the phrase `quick fox` would be considered more relevant than `quick brown fox`(source: [Elastic](https://www.elastic.co/guide/en/elasticsearch/reference/7.0/query-dsl-query-string-query.html#_fuzziness)).

### **Boosting operators**

Use the _boost_ operator <kbd>^</kbd> to make one term more relevant than another. For instance, if we want to find all documents about foxes, but we are especially interested in quick foxes:

> quick^2 fox

The default boost value is 1, but can be any positive floating point number. Boosts between 0 and 1 reduce relevance. Boosts can also be applied to phrases or to groups:

> "john smith"^2 (foo bar)^4

(source: [Elastic](https://www.elastic.co/guide/en/elasticsearch/reference/7.0/query-dsl-query-string-query.html#_fuzziness))

### **Regular expressions (Regex)**

‌"A regular expression (shortened as regex or regexp) is a sequence of characters that define a search pattern." ([Wikipedia](https://en.wikipedia.org/wiki/Regular_expression)).

1\. You can use Regex in Datashare. Regular expressions (Regex) in Datashare need to be **written between 2 slashes.**

> /.\*..\*@.\*..\*/

The example above will search for any expression which is **structured like an email address** with a dot between two expressions before the @ and a dot between two expressions after the @ like in 'first.lastname@email.com' for instance.

2\. Regex can be combined with standard queries in Datashare :

> ("Ada Lovelace" OR "Ado Lavelace") AND paris AND /.\*..\*@.\*..\*/

3\. **You need to escape the following characters by typing a backslash just before them (without space):‌ # @ & < > \~**

> /.\*..\*@.\*..\*/ (the @ was escaped by a backslash \ just before it)

4\. Important: **Datashare relies on Elastic's Regex syntax** as explained[ here](https://www.elastic.co/guide/en/elasticsearch/reference/current/regexp-syntax.html). Datashare uses [the Standard tokenizer](https://www.elastic.co/guide/en/elasticsearch/reference/current/analysis-standard-tokenizer.html). A consequence of this is that **spaces cannot be searched as such in Regex**.

We encourage you to **use the&#x20;**<kbd>**AND**</kbd>**&#x20;operator** to work around this limitation and make sure you can make your search.

If you're looking for French International Bank Account Number (IBAN) that can or cannot contain space and contain FR followed by numbers and/or letters (it could be FR7630001007941234567890185 ou FR76 3000 4000 0312 3456 7890 H43 for example), you can then search for:

> /FR\[0-9]{14}\[0-9a-zA-Z]{11}/ OR (/FR\[0-9]{2}.\*/ AND /\[0-9]{4}.\*/ AND /\[0-9a-zA-Z]{11}.\*/)

Here are a few examples of useful Regex:

* You can search for <kbd>**/Dimitr\[iyu]/**</kbd> instead of searching for **Dimitri OR Dimitry OR Dimitru**. It will find all the Dimitri, Dimitry or Dimitru.
* You can search for <kbd>**/Dimitr\[^yu]/**</kbd> if you want to search all the words which begin with Dimitr and **do not end with either y nor u.**
* You can search for <kbd>**/Dimitri<1-5>/**</kbd> if you want to search **Dimitri1, Dimitri2, Dimitri3, Dimitri4 or Dimitri5**.

Other common Regex examples:

* phone numbers with "-" and/or country code like +919367788755, 8989829304, +16308520397 or 786-307-3615 for instance: `/[\+]?[(]?[0-9]{3}[)]?[-\s.]?[0-9]{3}[-\s.]?[0-9]{4,6}/`
* emails ([simplified](https://stackoverflow.com/questions/201323/how-to-validate-an-email-address-using-a-regular-expression)): `/[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+.[a-zA-Z0-9-.]+/`
* credit cards: `/(?:4[0-9]{12}(?:[0-9]{3})?|[25][1-7][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35[0-9]{3})[0-9]{11})/`

You can find many other examples [on this site](https://ihateregex.io/). More generally, if you use a regex found on internet, beware that the syntax is not necessarily compatible with elasticsearch's. For example `\d`, `\S` and the like [are not understood](https://www.elastic.co/guide/en/elasticsearch/reference/current/regexp-syntax.html).

### **Search with metadata fields**

{% stepper %}
{% step %}
In '**Search**' > '**Documents**', open a **document** and go to the '**Metadata**' tab:

<figure><img src="../.gitbook/assets/Screenshot 2025-06-12 at 07.44.14.png" alt="Screenshot of Datashare&#x27;s document page with the &#x27;Metadata&#x27; tab highlighted"><figcaption></figcaption></figure>
{% endstep %}

{% step %}
Click a metadata's **search** **icon** to search documents with same properties:

<figure><img src="../.gitbook/assets/Screenshot 2025-06-12 at 07.46.24.png" alt="Screenshot of Datashare&#x27;s document page in the &#x27;Metadata&#x27; tab at scroll level of &#x27;Content text length&#x27; with the magnifying glass icon hovered with the tooltip &#x27;Search this metadata value&#x27; highlighted"><figcaption></figcaption></figure>
{% endstep %}

{% step %}
See the **query** in the main search bar. It contains the field name, two dots and the searched value:

<figure><img src="../.gitbook/assets/Screenshot 2025-06-12 at 07.49.52.png" alt="Screenshot of Datashare&#x27;s document search page with the search bar displaying &#x27;contentTextLength:&#x22;26952&#x22;&#x27; highlighted"><figcaption></figcaption></figure>

So for example, if you are looking for documents that:

* Contains term1, term2 and term3
* And were created after 2010

you can use the 'Date' filter or type in the search bar:

> term1 AND term2 AND term3 AND metadata.tika\_metadata\_creation\_date:>=2010-01-01

Explanations:

* 'metadata.tika\_metadata\_creation\_date:' means that we filter with creation date
* '>="'means 'since January 1st included'
* '2010-01-01' stands for January 2010 and the search will include January 2010

For other searches:

* '<' will mean 'strictly before (with January 1st excluded)'
* no character will mean 'at this exact date'

**Ranges**: You can also search for numbers in a range. Ranges can be specified for **date**, **numeric** or **string fields** among the ones you can find by clicking the magnifying glass when you hover the fields in a document's tab 'Metadata'. Inclusive ranges are specified with square brackets \[min TO max] and exclusive ranges with curly brackets {min TO max}. For more details, please refer to [Elastic's page on ranges](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-query-string-query.html#_ranges).
{% endstep %}
{% endstepper %}

