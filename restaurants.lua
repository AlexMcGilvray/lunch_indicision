restaurants = {}

local Restaurant = {
  name = "uninitialized",
  distanceInBlocks = -1,
  score = -1
}

function initRestaurants()
  --The Hub
  rTheHub = {
    name = "The Hub",
    distanceInBlocks = 1,
    score = 50 
  }
  table.insert(restaurants,rTheHub) 
  --Salsa y Agave
  rSalsaAndAgave = {
    name = "Salsa y Agave",
    distanceInBlocks = 2,
    score = 50 
  }
  table.insert(restaurants,rSalsaAndAgave) 
  --Phat Sandwiches 
end
