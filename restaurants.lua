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
  rSalsaAndAgave = {
    name = "Phat Sandwiches",
    distanceInBlocks = 2,
    score = 50 
  }
  table.insert(restaurants,rSalsaAndAgave) 
  rSalsaAndAgave = {
    name = "The parlour",
    distanceInBlocks = 2,
    score = 50 
  }
  table.insert(restaurants,rSalsaAndAgave) 
  rAlphaSushi = {
    name = "Alpha Sushi",
    distanceInBlocks = 2,
    score = 50 
  }
  table.insert(restaurants,rAlphaSushi) 
end
