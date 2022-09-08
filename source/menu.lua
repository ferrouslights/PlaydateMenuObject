import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "Choice"

local mainMenuChoices = {
	Choice(true, "start"),
	Choice(true, "pause"),
	Choice(true, "end game")
}

class('Menu', {
	enabled = true, 		-- if the user is allowed to interact
	title = "", 			-- menu title
	cursor = nil, 			-- cursor object for rendering
	cursorPosition = 0, 	-- top of the menu in the list
	choices = {} 			-- list of choices
}).extends()

function Menu:init(enabled, title, cursor, choices)
	-- Set up the player.
	Menu.super.init(self)
	
	self.enabled = enabled
	self.title = title
	self.cursor = cursor
	if (choices == "main") then
		self.choices = mainMenuChoices
	end
end

function Menu:spawn(x,y)
	-- The :setCenter() call specifies that the sprite will be anchored at its center.
	-- The :moveTo() call moves our sprite to the center of the display.
	
	-- TODO render menu box
	-- TODO spawn all choices
	-- TODO add pagination
	-- TODO spawn cursode
end

function Menu:listenForInput()
	if (self.enabled == false) then
		return
	end
		
	if playdate.buttonIsPressed( playdate.kButtonUp ) then
		self.moveCursor(true)
		print("up pressed")
		return
	end
	
	if playdate.buttonIsPressed( playdate.kButtonDown ) then
		self.moveCursor(false)
		print("down pressed")
		return
	end
end

function Menu:moveCursor(isUp)
	if (isUp) then
		print("moving cursor up")
	else
		print("moving cursor down")
	end
end