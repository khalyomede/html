module test

import html

fn test_should_return_decoded_special_characters() {
	assert html.decode("&#x3C;script&#x3E;alert(&#x27;malicious&#x27;)&#x3C;/script&#x3E;") == "<script>alert('malicious')</script>"
}
