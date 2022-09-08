import "CoreLibs/object"
import "CoreLibs/graphics"

class('Choice', {
	enabled = true,
	text = ""
}).extends()

function Choice:init(enabled, text)
	-- Set up the player.
	Choice.super.init(self)
	
	self.enabled = enabled
	self.text = text
end

function Choice:execute()
	if enabled then
		print("I was clicked!")
	end
end