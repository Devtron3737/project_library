//uniq, returns only the uniq elemnts of the array

var uniq = function(array) {
  var result = [];
  var count_obj = {}
  for (i = 0; i < array.length; i++) {
      if (array[i] in count_obj) {
      } else {
        result.push(array[i]);
        count_obj[array[i]] = 1
      }
    }

    return result
}
// console.log(uniq([1,1,2,2,3,4,4]))
// finds all position pairs that have value that sum to 0
// so returnns array of two-el arrays
var twosum = function (array) {
  var result = []
  for (i = 0; i < array.length; i++) {
    for (j = i; j < array.length; j++) {
      if (array[i] + array[j] == 0) {
        result.push([i, j])
      }
    }
  }
  return result
}

// choose day to but and sell that results in highest profit
var stockpicker = function (array) {
  var best = 0;
  var days = [];
  for (io = 0; io < array.length; io++) {
    for (i = io; i < array.length; i++) {
      if (array[i] - array[io] > best) {
        best = array[i] - array[io];
        days = [io, i];
      }
    }
  }
  return days
}

test = 0

// var myeach = function (array, func) {
//   for (var i = 0; i < array.length; i++) {
//     func(array[i])
//   }
// }

var timesTwo = function(num) {
  return num * 2
}

var thing = [11, 12, 13, 14]

var add = function (num1, num2) {
  return num1 + num2
}

Array.prototype.myEach = function(func) {
  for (var i = 0; i < this.length; i++) {
    func(this[i]);
  }
  return this;
};

Array.prototype.myMap = function (func) {
  var mappedArray = [];
  this.myEach( function (el) {
    mappedArray.push(func(el));
  });
  return mappedArray
}


Array.prototype.myInject = function (func) {
    var accum = null;
    this.myEach( function (element) {
      accum = func(element, accum);
    });
    return accum;
}

// console.log(thing.myInject(add))

var threeCheck = function(num) {
  if (num == 13) {
    test = 1
  }
}

// var myInject = function(array, func) {
//   var accum = array[0]
//   for (i = 1; i < array.length; i++) {
//     accum = func(accum, array[i])
//   }
//   return accum
// }

// each doesnt return anything
// each is way of looking at each value. need to pass other funncion that will
// do something to values, and push to result
// then return result
// var myMap = function(array, func) {
//   var result = [];
//   for (var i = 0; i < array.length; i++) {
//     var new_el = func(array[i])
//     result.push(new_el)
//   }
//   return result
// }

// console.log(mymap(thing, timesTwo))

// keep acuulating calls on top of each other, starting with value of first el



// range takes start and end and returns all numbers inbetween
// NOT WORKING
var range = function (start, end) {
  if (start == end) {
    return end
  } else {
    return start + range(start + 1, end)
  }
}

// console.log(range(1, 5))

var sumrec = function (array) {
  if (array.length == 1) { return array[0] }
  var sarray = array.slice(1, array.length);
  return array[0] + sumrec(sarray)
}

// console.log(sumrec([1, 3, 5]))

// next number determined by adding two previous nums
// returns n fib seq
// var fibrec = function (n) {
//   var result = [0, 1];
//   if (n == 0) {return 0}
//   if (n == 1) {return result}
//   result.push(result
//   result.push()
// }

// return indice where target is in array
// doesnt work if targ is last element (off by 1)
// also returns NaN if el isnt in array
var binarysearch = function (array, target) {
  var middle = array[Math.floor(array.length/2)];
  var middle_loc = Math.floor(array.length/2);
  if (middle == target) {
    return middle_loc
  } else if (array.length == 1) {
    return null
  } else if (middle < target) {
      return middle_loc + binarysearch(array.slice(middle_loc + 1, array.length), target)
  } else if (middle > target) {
      return binarysearch(array.slice(0, middle_loc), target);
  }
}

console.log(binarysearch([1, 5, 6, 8, 11], 11))

// amount to make change for, coins available
// want the least amount of coins
// should return array with coins needed
var makeChange = function (amount, coins) {
    
}
