import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "Choice"

local mainMenuChoices = {
	3,
	Choice(true, "start"), 		--1 
	Choice(true, "pause"), 		--2
	Choice(true, "end game") 	--3
}

class('Menu', {
	enabled = true, 		-- if the user is allowed to interact
	title = "", 			-- menu title
	cursor = nil, 			-- cursor object for rendering
	cursorPosition = 1, 	-- top of the menu in the list
	choices = {},			-- list of choices
	movementCooldown = 10,	-- how long in frames does the menu cool down before allowing nav again
	movementCooldownCounter = 0,		-- counter for checking when cooldown is over
}).extends()

function Menu:init(enabled, title, cursor, choices)
	-- Set up the player.
	Menu.super.init(self)
	
	self.enabled = enabled
	self.title = title
	self.cursor = cursor
	self.choices = mainMenuChoices
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
	
	if (self.movementCooldownCounter > 0) then
		if (self.movementCooldownCounter < self.movementCooldown) then
			self:incrementCounter()
			return
		else
			self:resetCounter()
		end
	end
		
	if playdate.buttonIsPressed( playdate.kButtonUp ) then
		self:moveCursor(1)
		self:incrementCounter()
		print("up pressed")
		return
	end
	
	if playdate.buttonIsPressed( playdate.kButtonDown ) then
		self:moveCursor(-1)
		self:incrementCounter()
		print("down pressed")
		return
	end
end

function Menu:update()
	playdate.graphics.clear()
	self.cursor = playdate.graphics.drawText("*" .. self.cursorPosition .. "*", 200, 120)
	
	self:listenForInput()
end

function Menu:incrementCounter()
	self.movementCooldownCounter += 1
end

function Menu:resetCounter()
	self.movementCooldownCounter = 0
end

function Menu:moveCursor(direction)
	length = 3
	if (direction > 0) then
		if (self.cursorPosition + 1 > length) then
			self.cursorPosition = 1
		else
			self.cursorPosition += 1
		end
		print("moving cursor up")
	else
		if (self.cursorPosition - 1 < 1) then
			self.cursorPosition = length
		else
			self.cursorPosition -= 1
		end
		print("moving cursor down")
	end
end