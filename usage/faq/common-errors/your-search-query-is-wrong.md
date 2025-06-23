---
description: This can be due to some syntax errors in the way you wrote your query.‌
---

# 'We were unable to perform your search.' What should I do?

Here are **the most common errors that you should correct:** ‌

### **The query starts with AND** <a href="#querie-s-start-s-with-and-all-uppercase" id="querie-s-start-s-with-and-all-uppercase"></a>

You cannot start a query with AND all uppercase. [AND is reserved as a search operator](../../search-with-operators.md#and-or).

<figure><img src="../../../.gitbook/assets/Screenshot 2025-06-17 at 10.21.32.png" alt="Screenshot of Datashare&#x27;s search page with &#x27;AND ikea&#x27; in the search bar and the message &#x27;We were unable to perform your search. This might be due to a server error or a syntax error in your query&#x27;"><figcaption></figcaption></figure>

### **The query starts with OR** <a href="#querie-s-start-s-with-or-all-uppercase" id="querie-s-start-s-with-or-all-uppercase"></a>

You cannot start a query with OR all uppercase. [OR is reserved as a search operator](../../search-with-operators.md#or-or-space).

<figure><img src="../../../.gitbook/assets/Screenshot 2025-06-17 at 10.22.08.png" alt="Screenshot of Datashare&#x27;s search page with &#x27;OR ikea&#x27; in the search bar and the message &#x27;We were unable to perform your search. This might be due to a server error or a syntax error in your query&#x27;"><figcaption></figcaption></figure>

### **The query contains only one double-quote: "** <a href="#querie-s-contain-s-only-one-double-quote-or-a-double-quote-in-a-word" id="querie-s-contain-s-only-one-double-quote-or-a-double-quote-in-a-word"></a>

‌You cannot start or type a query with only one double quote. [Double quotes are reserved as a search operator](../../search-with-operators.md#double-quotes-for-exact-phrase) for exact phrase.

<figure><img src="../../../.gitbook/assets/Screenshot 2025-06-17 at 10.23.04.png" alt="Screenshot of Datashare&#x27;s search page with &#x27;&#x22;ikea&#x27; in the search bar and the message &#x27;We were unable to perform your search. This might be due to a server error or a syntax error in your query&#x27;"><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/Screenshot 2025-06-17 at 10.23.58.png" alt="Screenshot of Datashare&#x27;s search page with &#x27;ikea&#x22;&#x27; in the search bar and the message &#x27;We were unable to perform your search. This might be due to a server error or a syntax error in your query&#x27;"><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/Screenshot 2025-06-17 at 10.24.27.png" alt="Screenshot of Datashare&#x27;s search page with &#x27;ik&#x22;ea&#x27; in the search bar and the message &#x27;We were unable to perform your search. This might be due to a server error or a syntax error in your query&#x27;"><figcaption></figcaption></figure>

### **The query contains only one parenthesis: ( or )** <a href="#querie-s-contain-s-only-one-double-quote-or-a-double-quote-in-a-word" id="querie-s-contain-s-only-one-double-quote-or-a-double-quote-in-a-word"></a>

‌You cannot start or type a query with only one parenthesis. [Parenthesis are reserved for combining operators](../../search-with-operators.md#combine-operators).

<figure><img src="../../../.gitbook/assets/Screenshot 2025-06-17 at 10.25.01.png" alt="Screenshot of Datashare&#x27;s search page with &#x27;(ikea&#x27; in the search bar and the message &#x27;We were unable to perform your search. This might be due to a server error or a syntax error in your query&#x27;"><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/Screenshot 2025-06-17 at 10.25.25.png" alt="Screenshot of Datashare&#x27;s search page with &#x27;ikea)&#x27; in the search bar and the message &#x27;We were unable to perform your search. This might be due to a server error or a syntax error in your query&#x27;"><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/Screenshot 2025-06-17 at 10.25.53.png" alt="Screenshot of Datashare&#x27;s search page with &#x27;ik(ea&#x27; in the search bar and the message &#x27;We were unable to perform your search. This might be due to a server error or a syntax error in your query&#x27;"><figcaption></figcaption></figure>

### **The query contains only one forward slash: /**

‌You cannot start or type a query with only one forward slash. Forward slashes are reserved for regular expressions (Regex).

<figure><img src="../../../.gitbook/assets/Screenshot 2025-06-17 at 10.26.49.png" alt="Screenshot of Datashare&#x27;s search page with &#x27;/ikea&#x27; in the search bar and the message &#x27;We were unable to perform your search. This might be due to a server error or a syntax error in your query&#x27;"><figcaption></figcaption></figure>

### **The query starts with or contains tilde:** \~ <a href="#querie-s-start-s-with-or-contain-tilde" id="querie-s-start-s-with-or-contain-tilde"></a>

‌You cannot start a query with tilde (\~) or write one which contains tilde. Tilde is reserved as a search operator for [fuzziness](../../search-with-operators.md#fuzziness) or [proximity searches](../../search-with-operators.md#proximity-searches).

<figure><img src="../../../.gitbook/assets/Screenshot 2025-06-17 at 16.01.44 (1).png" alt="Screenshot of Datashare&#x27;s search page with &#x27;~ikea&#x27; in the search bar and the message &#x27;We were unable to perform your search. This might be due to a server error or a syntax error in your query&#x27;"><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/Screenshot 2025-06-17 at 16.02.17 (1).png" alt="Screenshot of Datashare&#x27;s search page with &#x27;ik~ea&#x27; in the search bar and the message &#x27;We were unable to perform your search. This might be due to a server error or a syntax error in your query&#x27;"><figcaption></figcaption></figure>

### **The query ends with question mark: !** <a href="#querie-s-start-s-with-or-contain-circumflex" id="querie-s-start-s-with-or-contain-circumflex"></a>

You cannot end a query with question mark (!). [Question mark is reserved as a search operator for excluding a term](../../search-with-operators.md#not-or-or).

<figure><img src="../../../.gitbook/assets/Screenshot 2025-06-17 at 16.16.19.png" alt="Screenshot of Datashare&#x27;s search page with &#x27;ikea!&#x27; in the search bar and the message &#x27;We were unable to perform your search. This might be due to a server error or a syntax error in your query&#x27;"><figcaption></figcaption></figure>

### **The query starts with or contains caret:** ^ <a href="#querie-s-start-s-with-or-contain-circumflex" id="querie-s-start-s-with-or-contain-circumflex"></a>

‌You cannot start a query with caret (^) or write one which contains caret. [Caret is reserved as a boosting operator](../../search-with-operators.md#boosting-operators).

<figure><img src="../../../.gitbook/assets/Screenshot 2025-06-17 at 16.17.40.png" alt="Screenshot of Datashare&#x27;s search page with &#x27;^ikea&#x27; in the search bar and the message &#x27;We were unable to perform your search. This might be due to a server error or a syntax error in your query&#x27;"><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/Screenshot 2025-06-17 at 16.18.07.png" alt="Screenshot of Datashare&#x27;s search page with &#x27;ik^ea&#x27; in the search bar and the message &#x27;We were unable to perform your search. This might be due to a server error or a syntax error in your query&#x27;"><figcaption></figcaption></figure>

### The query **contains** square brackets: \[ or ]

You cannot use square brackets [except for searching for ranges](../../search-with-operators.md#search-with-metadata-fields).

<figure><img src="../../../.gitbook/assets/Screenshot 2025-06-17 at 16.19.13.png" alt="Screenshot of Datashare&#x27;s search page with &#x27;[ikea]&#x27; in the search bar and the message &#x27;We were unable to perform your search. This might be due to a server error or a syntax error in your query&#x27;"><figcaption></figcaption></figure>
