module html

fn text_to_entity(text string) string {
	return "&#x" + text.bytes().hex().to_upper() + ";"
}
