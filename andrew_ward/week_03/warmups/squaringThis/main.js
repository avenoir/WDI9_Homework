// For example, given the collection of numbers: 
// - 1, 2, 3, 4, 5
// And the operation:
// - square a number
// Your code should be able to produce the collection of squares:
// - 1, 4, 9, 16, 25

// ## Restrictions 
// Keep your hands off that collect/map/fmap/whatchamacallit functionality
// provided by your standard library!
// Solve this one yourself using other basic tools instead.
// By the way, make this the most horrible looking site in the World.
// Animations etc.

var squared = function (array) {
  var squared = [];
  for (var i = 0; i < array.length; i++) {
    squared[i] = array[i] * array[i];
  }
  return squared;
};