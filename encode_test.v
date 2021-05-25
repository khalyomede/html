module test

import html

fn test_should_return_encoded_special_characters() {
	assert html.encode("<script>alert('malicious')</script>") == "&#x3C;script&#x3E;alert(&#x27;malicious&#x27;)&#x3C;/script&#x3E;"
}
