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
  rPhatSandwiches = {
    name = "Phat Sandwiches",
    distanceInBlocks = 2,
    score = 50 
  }
  table.insert(restaurants,rPhatSandwiches) 
  --The Parlour
  rTheParlour = {
    name = "The Parlour",
    distanceInBlocks = 2,
    score = 50 
  }
  table.insert(restaurants,rTheParlour) 
  --Alpha Sushi
  rAlphaSushi = {
    name = "Alpha Sushi",
    distanceInBlocks = 2,
    score = 50 
  }
  table.insert(restaurants,rAlphaSushi) 
end


function pickRandomRestaurat()
end

--this would apply some kind of logic to reduce the likelyhood of a recently visited restaurant from being selected a second time. 
function pickRandomHistoryWeightedRestaurant()
end

--Takes in an array of restaurants and randomly selects a restaurant
function pickRandomRestaurantFromSet(arrayOfRestaurants)
end

--Takes in a distance structure (not yet defined) and returns a random restaurant that fits the criteria of the structure. Possibilities could be blocks distance, GPS based distance etc..
function pickRandomRestaurantWithinDistance(distanceStructure)
end

