----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()
require("restaurants")

-- Function to handle button events
local function handleButtonEvent( event )
    local selectedRestaurant = restaurants[ math.random( #restaurants ) ] 
    if ( "ended" == event.phase ) then 
        print( selectedRestaurant.name )
    end
end 

local button1 = widget.newButton
{
     
    id = "button1",
    label = "Default",
    onEvent = handleButtonEvent,
    fontSize = 32,
    shape="roundedRect",
    width = 400,
    height = 80,
    cornerRadius = 12,
    fillColor = { default={ 1, 0, 0, 1 }, over={ 1, 0.1, 0.7, 0.4 } },
    strokeColor = { default={ 1, 0.4, 0, 1 }, over={ 0.8, 0.8, 1, 1 } },
    strokeWidth = 4
}


local titleTextEffectData = {
  currentTime = 0,
  targetTime = 0.8,
  r = 1, g = 1, b = 1,
  isIncreasing = false}
local title = nil 
local debugText = nil

function scene:create( event )
	local sceneGroup = self.view
	initRestaurants()
	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
	
	-- create a white background to fill screen
	local bg = display.newRect( 0, 0, display.contentWidth, display.contentHeight )
	bg.anchorX = 0
	bg.anchorY = 0
	bg:setFillColor( 0 )	 
	
	-- create some text
	title = display.newText( "UFG Restaurant Decider", 0, 0, native.systemFont, 48 )
	title:setFillColor( 1 )	 
	title.x = display.contentWidth * 0.5
	title.y = 15
	
  --[[
  debugText = display.newText( "UFG Restaurant Decider", 0, 0, native.systemFont, 32 )
	debugText:setFillColor( 1 )	 
	debugText.x = 200
	debugText.y = 925
   ]]--
  
  --[[
	local newTextParams = { text = "Loaded by the first tab's\n\"onPress\" listener\nspecified in the 'tabButtons' table", 
						x = 0, y = 0, 
						width = 310, height = 310, 
						font = native.systemFont, fontSize = 14, 
						align = "center" }
	local summary = display.newText( newTextParams )
	summary:setFillColor( 0 ) -- black
	summary.x = display.contentWidth * 0.5 + 10
	summary.y = title.y + 215
  ]]--
	
	-- all objects must be added to group (e.g. self.view)
  
  button1.x = display.contentCenterX
  button1.y = display.contentCenterY
  
  
	sceneGroup:insert( bg )
	sceneGroup:insert( title ) 
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
  
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end



function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

 local function onEveryFrame( event )
    --print( "This function will be called on every frame." )
  if titleTextEffectData.isIncreasing then
    titleTextEffectData.currentTime = titleTextEffectData.currentTime + 0.01
  else
    titleTextEffectData.currentTime = titleTextEffectData.currentTime - 0.01
  end
  
  if titleTextEffectData.currentTime >= titleTextEffectData.targetTime then
    titleTextEffectData.isIncreasing = false 
  end
  if titleTextEffectData.currentTime <= 0.6 then
    titleTextEffectData.isIncreasing = true
  end 
  titleTextEffectData.r = titleTextEffectData.currentTime 
  --debugText.text = "x " .. titleTextEffectData.currentTime
  title:setFillColor( titleTextEffectData.r,titleTextEffectData.r,titleTextEffectData.r)	 
end

-- assign the above function as an "enterFrame" listener
Runtime:addEventListener( "enterFrame", onEveryFrame )
---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene ) 
-----------------------------------------------------------------------------------------

return scene