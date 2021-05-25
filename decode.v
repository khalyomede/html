module html

pub fn decode(text string) string {
	mut decoded_html := text

	encoded_characters := ['"', "&", "\\", "<", ">", "`", "'"].map(fn (character string) string {
		return html.text_to_entity(character)
	})

	for encoded_character in encoded_characters {
		decoded_html = decoded_html.replace(encoded_character, html.entity_to_text(encoded_character))
	}

	return decoded_html
}
