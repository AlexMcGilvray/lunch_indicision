-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- show default status bar (iOS)
display.setStatusBar( display.DefaultStatusBar )

-- include Corona's "widget" library
local widget = require "widget"
local composer = require "composer"


-- event listeners for tab buttons:
local function onFirstView( event )
	composer.gotoScene( "mainmenu" )
end

local function onSecondView( event )
	composer.gotoScene( "view2" )
end


-- create a tabBar widget with two buttons at the bottom of the screen

 

onFirstView()	-- invoke first tab button's onPress event manually