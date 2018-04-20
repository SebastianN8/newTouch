-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- Created by: Sebastian N
-- Created on: April 17
--
-- This program contains an sprite with single touch and another with comprehensive touch
-----------------------------------------------------------------------------------------

-- Background
display.setDefault('background', 0, 0.3, 0)

-- Image 1
local myPizza = display.newImageRect('./Assets/Sprites/Pizza-icon.png', 300, 300 )
myPizza.x = display.contentCenterX
myPizza.y = display.contentCenterY
myPizza.id = 'The pizza'

-- Image 1 atributes
local function myPizzaThere(event)
	if (event.phase == 'began') then
		print('The event began on '.. event.target.id)
		
	elseif (event.phase == 'ended') then
		print('The event ended on '.. event.target.id)
	end
	return true
end

myPizza:addEventListener('touch', myPizzaThere)


-- Image 2
local myNinja = display.newImageRect('./Assets/Sprites/Ninja.png', 400, 500)
myNinja.x = display.contentCenterX + 600
myNinja.y = display.contentCenterY - 400
myNinja.id = 'The Ninja'

function myNinja:touch(event)
	if (event.phase == 'began') then
		print('The event began on '.. self.id)

		-- Set Focus
		display.getCurrentStage():setFocus(self)
		self.isFocus = true

	elseif (event.phase == 'moved') then
		-- Ninja moves
		myNinja.x = event.x
		myNinja.y = event.y
		print(myNinja.x.. ', '..myNinja.y)


	elseif (event.phase == 'ended' or event.phase == 'cancelled') then
		print('The event ended on '.. self.id)

			display.getCurrentStage():setFocus(nil)
			self.isFocus = nil
	end
	return true
end

myNinja:addEventListener('touch', myNinja)

