# html

Functions to encode and decode HTML strings in V.

## Summary

- [About](#about)
- [Features](#features)
- [Installation](#installation)
- [Examples](#examples)
- [Advices](#advices)
- [Test](#test)

## About

I created this library to prevent XSS injection when displaying HTML from user inputs.

## Features

- Can encode HTML tags
- Can decode HTML tags

## Installation

```bash
v install khalyomede.html
```

## Examples

- [1. Encode HTML tags](#1-encode-html-tags)
- [2. Decode HTML tags](#2-decode-html-tags)

### 1. Encode HTML tags

In this example, we will encode HTML tags. This helps not to execute the rendered HTML, and prevent [XSS attacks](https://en.wikipedia.org/wiki/Cross-site_scripting).

```v
import khalyomede.html

fn main() {
  html_content := "<script>alert('malicious');</script>"
  encoded_content := html.encode(html_content)

  println(encoded_content)
}
```

```bash
$ v run src/index.v
"&#x3C;script&#x3E;alert(&#x27;malicious&#x27;)&#x3C;/script&#x3E"
```


### 2. Decode HTML tags

In this example, we will decode HTML from its encoded counterpart. Note that if the encoded text has not been encoded using the library `html.encode()` function, the result might not be correct as this library only encodes a few set of HTML characters.

```v
import khalyomede.html

fn main() {
  encoded_content := "&#x3C;script&#x3E;alert(&#x27;malicious&#x27;)&#x3C;/script&#x3E"
  decoded_content := html.decode(encoded_content)

  println(decoded_content)
}
```

```bash
$ v run src/index.v
"<script>alert('malicious');</script>"
```

## Advices

1. Always use `html.encode()` on data you are getting (user filled form fields, database result, API responses, ...)
2. Do not store encoded HTML in your datastore (database, file, ...) as your app is probably not the only consumer of the data, and as this method is opiniated in the sense it will only encode a few critical characters, another consumer that decodes with a different method than `html.decode()` will not get a correct result

## Test

```v
v run src/test
```
