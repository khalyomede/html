module html

import strconv

/*
Credits: https://discord.com/channels/592103645835821068/592294828432424960/845699218374262835
*/
fn entity_to_text(text string) string {
	return byte(strconv.parse_int(text.replace("&#x", "").replace(";", ""), 16, 8)).ascii_str()
}
