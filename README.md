# lunch_indicision
App for randomly picking a place to get lunch in yaletown vancouver. 

Restaurant data definition
+ latitude
+ longitude
+ randomSelectionBias
+ name


### Idea for the biased random restaurant selection algorithm.

##### When a user selects a restaurant :
1. if data file exists goto 3 else goto 2
2. create data file and itereate through all restaurants. The starting randomSelectionBias for each restaurant is set to 1/x where x is the number of restaurants in the restaurant collection 
3. 
