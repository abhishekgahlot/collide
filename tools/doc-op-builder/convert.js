$('body').ready(function() {
  $('#convert').click(function() {
    $('#output').text(convert($('#input').val().replace(/^\s+|\s+$/g, '')));
  ;})
});

var methodNameMap = {
  'I': 'insert',
  'R': 'retain',
  'D': 'delete',
  'RL': 'retainLine'
};

// e.g. input: RL(66)R(27)RL(3)R(21)RL(91)R(23)I(as(!)
convert = function(input) {
  var output = "builder";

  var accept = function(component, value) {
    if (component == 'I' || component == 'D') {
      value = '"' + value.replace(/\"/g, '\\"') + '"';
    } else if (component == 'R') {
      if (value.slice(-2) == '\\n') {
        value = (parseInt(value.slice(0, -2)) + 1) + ', true';
      } else {
        value = value + ', false';
      }
    }
    
    output += "." + methodNameMap[component] + '(' + value + ')';
  };

  re = /(?:^|\))(RL|R|D|I)\(/g;
  var curBeginIndex, curComponent, match;
  while ((match = re.exec(input)) != null) {
    if (curBeginIndex) {
      var curEndIndex = match.index;
      accept(curComponent, input.substring(curBeginIndex, curEndIndex));
    }
  
    curComponent = match[1];
    curBeginIndex = match.index + match[0].length;
  }
  
  accept(curComponent, input.substring(curBeginIndex, input.length - 1));
  
  return output + '.build()';
}