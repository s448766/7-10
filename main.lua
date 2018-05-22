-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- Created  Md Faiyaz Hossain
-- Created  May 
--
-----------------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)

local dPad = display.newImage( "./assets/sprites/d-pad.png" )
dPad.x = 150
dPad.y = display.contentHeight - 150
dPad.id = "d-pad"
dPad.alpha = 0.50

local rightArrow = display.newImage( "./assets/sprites/rightArrow.png" )
rightArrow.x = 260
rightArrow.y = display.contentHeight - 150
rightArrow.id = "right arrow"

local jumpButton = display.newImage( "./assets/sprites/jumpButton.png" )
jumpButton.x = display.contentWidth - 80
jumpButton.y = display.contentHeight - 100
jumpButton.id = "jump button"
jumpButton.alpha = 0.5

local sheetOptionsIdleBoy = {
	width = 232,
	height = 439,
	numFrames = 10 
}



local sheetIdleNinjaBoy = graphics.newImageSheet( "./assets/spritesheets/ninjaBoyIdle.png", sheetOptionsIdleBoy )

local sheetOptionsRunBoy = {
	width = 363,
	height = 458,
	numFrames = 10
}



local sheetRunNinjaBoy = graphics.newImageSheet( "./assets/spritesheets/ninjaBoyJumpRun.png", sheetOptionsRunBoy )

local sheetOptionsIdleGirl = {
	width = 290,
	height = 500,
	numFrames = 10
}



local sheetIdleNinjaGirl = graphics.newImageSheet( "./assets/spritesheets/ninjaGirlIdle.png", sheetOptionsIdleGirl )



local sheetOptionsSlideGirl = {
	width = 397,
	height = 401,
	numFrames = 10
}

local sheetSlideNinjaGirl = graphics.newImageSheet( "./assets/spritesheets/ninjaGirlSlide.png", sheetOptionsSlideGirl )



-- sequence table
local sequence_data = {
	{
		name = "idleBoy",
		start = 1,
		count  = 10,
		time = 750,
		loopCount = 0,
		sheet = sheetIdleNinjaBoy

	},
	{
		name = "runBoy",
		start = 1,
		count  = 10,
		time = 600,
		loopCount = 1,
		sheet = sheetRunNinjaBoy
	},
	{
		name = "idleGirl",
		start = 1,
		count  = 10,
		time = 750,
		loopCount = 0,
		sheet = sheetIdleNinjaGirl
	},
	{
		name = "slideGirl",
		start = 1,
		count  = 10,
		time = 600,
		loopCount = 1,
		sheet = sheetSlideNinjaGirl
	}
}
local ninjaBoy = display.newSprite( sheetIdleNinjaBoy, sequence_data)
ninjaBoy.x = display.contentCenterX - 800
ninjaBoy.y = display.contentCenterY
ninjaBoy:setSequence( "idleBoy" )



local ninjaGirl = display.newSprite( sheetIdleNinjaGirl, sequence_data)
ninjaGirl.x = display.contentCenterX + 800
ninjaGirl.y = display.contentCenterY
ninjaGirl:setSequence( "idleGirl")

ninjaBoy:play()
ninjaGirl:play()

function rightArrow:touch( event )
	if ( event.phase == "ended" ) then 
		-- moves ninja Boy right 
		transition.moveBy( ninjaBoy, {


			x = 100, --move 100 pixels right
			y = 0, -- move 0 pixels vertically
			time = 600 -- move as long as animation
			} )


		ninjaBoy:setSequence( "runBoy")
		ninjaBoy:play()
	end
end

function jumpButton:touch( event )
	if ( event.phase == "ended" ) then 

	-- slide ninja Girl right
	transition.moveBy( ninjaGirl, {

		x = 100, --move 100 pixels right
		y = 0, -- move 0 pixels vertically
		time = 600 -- move as long as animation
		} )

	ninjaGirl:setSequence( 'slideGirl')
	ninjaGirl:play()
	end
end

local function resetIdleBoy( event )
	if (event.phase == 'ended') then

	-- go back to Idle animation for ninja Boy

	ninjaBoy:setSequence( 'IdleBoy')
	ninjaBoy:play()
	end
end
local function resetIdleGirl( event )
	if (event.phase == 'ended') then

	-- go back to Idle animation for ninja Girl

	ninjaGirl:setSequence( 'IdleGirl')
	ninjaGirl:play()
	end
end
jumpButton:addEventListener( 'touch', jumpButton )
rightArrow:addEventListener( 'touch', rightArrow )

--ninjaBoy:addEventListener( "sprite", resetToIdleBoy )
--ninjaGirl:addEventListener( "sprite", resetToIdleGirl )
