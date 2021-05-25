module html

pub fn encode(html string) string {
	return html.split("")
		.map(fn (character string) string {
			if character in ['"', "&", "\\", "<", ">", "`", "'"] {
				return html.text_to_entity(character)
			}

			return character
		})
		.join("")
}
