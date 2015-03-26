-- **********
-- LOCAL FUNCTION DECLARATIONS
-- ********** 
local gpsDistanceBetween
local updateGPS

-- **********
-- GLOBAL FUNCTION DECLARATIONS
-- ********** 
queueUpdateGPS = nil
getDistanceFromUser = nil

-- **********
-- DATA
-- ********** 
local myCoordinates = { 
  latitude = 0, 
  longitude = 0
} 
local latitude = display.newText( "-", 400, 1050, native.systemFont, 16 )
local longitude = display.newText( "-", 400, 1100, native.systemFont, 16 )
--local altitude = display.newText( "-", 100, 150, native.systemFont, 16 )
--local accuracy = display.newText( "-", 100, 200, native.systemFont, 16 )
--local speed = display.newText( "-", 100, 250, native.systemFont, 16 )
--local direction = display.newText( "-", 100, 300, native.systemFont, 16 )
--local time = display.newText( "-", 100, 350, native.systemFont, 16 )

-- **********
-- EVENT CALLBACKS
-- ********** 
local locationHandler = function( event )
    print("handling gps update")
    -- Check for error (user may have turned off location services)
    if ( event.errorCode ) then
        native.showAlert( "GPS Location Error", event.errorMessage, {"OK"} )
        print( "Location error: " .. tostring( event.errorMessage ) )
    else
        local latitudeText = string.format( 'latitude : %.4f', event.latitude )
        latitude.text = latitudeText

        local longitudeText = string.format( 'longitude : %.4f', event.longitude )
        longitude.text = longitudeText

        myCoordinates.latitude = event.latitude 
        myCoordinates.longitude = event.longitude  
        print("location succesfully updated")
        --local altitudeText = string.format( '%.3f', event.altitude )
        --altitude.text = altitudeText

        --local accuracyText = string.format( '%.3f', event.accuracy )
        --accuracy.text = accuracyText

        --local speedText = string.format( '%.3f', event.speed )
        --speed.text = speedText

        --local directionText = string.format( '%.3f', event.direction )
        --direction.text = directionText

        -- Note that 'event.time' is a Unix-style timestamp, expressed in seconds since Jan. 1, 1970
        --local timeText = string.format( '%.0f', event.time )
        --time.text = timeText
    end
    
end 

-- **********
-- LOCAL FUNCTION DEFINITIONS
-- ********** 
gpsDistanceBetween = function ( pos1, pos2 ) 
	local earthRadius = 6371 
	local lat1 = math.rad( pos1.latitude )
	local lon1 = math.rad( pos1.longitude )
	local lat2 = math.rad( pos2.latitude )
	local lon2 = math.rad( pos2.longitude ) 
	local distance = math.acos( math.sin ( lat1 ) * math.sin ( lat2 ) + math.cos( lat1 ) * math.cos ( lat2 ) * math.cos( lon2 - lon1 ) ) * earthRadius;
  
	return distance
end 
 
updateGPS = function() 
    queueUpdateGPS()  
    -- 10 second delay to query gps
    timer.performWithDelay( 10000, updateGPS )
end

-- **********
-- GLOBAL FUNCTION DEFINITIONS
-- **********  
queueUpdateGPS = function()
  Runtime:removeEventListener( "location", locationHandler )    
  Runtime:addEventListener( "location", locationHandler )   
end

getDistanceFromUser = function(restaurant)
  local distanceFromUser = gpsDistanceBetween(myCoordinates,restaurant)
  print(distanceFromUser)
  return distanceFromUser
end  

-- **********
-- EVENT BINDING
-- ********** 
-- Activate location listener
Runtime:addEventListener( "location", locationHandler )

-- **********
-- FUNCTION CALLS
-- ********** 
updateGPS() 