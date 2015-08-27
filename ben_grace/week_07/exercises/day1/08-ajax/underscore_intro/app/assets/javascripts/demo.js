var numbers = []

var showNumbers = function(){
  $('#output').empty();
  _(numbers).each(function (n){
    $('<div class="box"/>').text(n).prependTo('#output')
  });
};

var addNumber = function() {
  var n = $('#number').val();
  n = ~~(n); //parseInt looks like a sperm because reasons
  numbers.push(n);

  showNumbers()

  $('#number').val('').focus();
};

var squareNumbers = function (){
  numbers = _(numbers).map(function (n) {return n * n; });
  showNumbers();
};

var funkifyNumbers = function(){
  numbers = _(numbers).map(funkify);
  showNumbers()
}

var funkify = function (x) {
  var equation = $('#number').val();
  return eval(equation);
};

var addRandom = function(){
  numbers.push(_.random(1,255));
  console.log('afsdfa');
  showNumbers();
};

var timerID;
var startSpew = function(){
  timerID = setInterval(addRandom, 100);

}

var stopSpew = function () {
  clearInterval(timerID)
}

$(document).ready(function(){

  $('#add_number').on('click', addNumber);
  $('#square').on('click', squareNumbers);
  $('#funkify').on('click', funkifyNumbers);

  $('#start').on('click', startSpew);
  $('#stop').on('click', stopSpew);

});