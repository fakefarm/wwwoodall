---
title: 'JS syntax: Return'
date: 2014-08-27 19:51 UTC
tags: javascript
layout: blog
---
###### Stop getting undefined

## JS syntax: Return

### Stop getting undefined

My first programming language was Ruby. Managing a return value wasn't something I had to do. This is an example of my Ruby-inspired functions;

~~~javascript
function check_box() {
  'checked';
}
check_box();
=> undefined
~~~
So, what you need to do is explicitly add a keyword `return`

~~~javascript
function check_box() {
  return 'checked';
}
check_box();
=> checked
~~~

It took me a while to figure out if this is a good or bad design.

~~~javascript
function check_box(answer) {
  if (answer) "This is true.";
  else if (!answer) "Less is more.";
  "Never reached.";
}
check_box(true);
=> undefined
~~~

JavaScript is so fluid, the wrong answer doesn't provide an error. So, I was left scratching my head. Turns out, JavaScript requires you to manage your return value. If you don't set it, then you will get `undefined`.

`return` will terminate the function and spit out as it sees. No need to assign the argument to a variable.

~~~javascript
function check_box(answer) {
  if (answer) return "This is true.";
  else if (!answer) return "Less is more.";
  return "Never reached.";
}

check_box(true);
=> "This is true.".

check_box(false);
=> "Less is more."
~~~

Getting comfortable with the shorthand conditional syntax. If you put the conditional on one line, the `{}` are not needed. 
Even when having multiple conditionals. 


### Using a var
Maybe you don't want to have a return to interrupt the sequence of the function. You could assign a value to a variable and return the variable at the end.

~~~javascript
function check_box(answer) {
  var entry;
  if (answer) entry = "This is true.";
  else if (!answer) entry = "Less is more.";
  return entry;
}

check_box(true);
=> "This is true."

check_box(false);
=> "Less is more."
~~~

#### Possible gotcha

If you are using the variable approach. Be careful to notice if there are any return values before returning a variable. Returns exit the program immediately.

~~~javascript
function check_box(answer) {
  var entry;
  if (answer) entry = "This is true.";
  else if (!answer) entry = "Less is more.";
  return "I am not what you expect.";
  return entry;
}

check_box(true);
=> "I am not what you expect."
~~~

### A return is not called on a false conditional

~~~javascript
function check_box(answer) {
  var entry;
  if (answer) entry = "This is true.";
  else if (!answer) entry = "Less is more.";
  else return "Why can't we return to shallow topics?";
  return entry;
}

check_box(true);
=> "This is true."
~~~

This makes logical sense, but it's good to note the syntax. I wasn't paying attention and thought that my return in the following `else` clause would have been the functions return value. It's because the previous was checking boolean and the if/elseif/else was met at a higher level, so the conditional never hit the else. The else had a return, but it wasn't called.

The return is only returned when it's called. Not just because it's in the code.

I figured it out when I moved the conditionals from boolean, to checking strings; I was thinking that the `origins()` call, while true would have returned 'open for discussion' but the reason it didn't, was because the conditional had been met in the `if` block and moved out of that sequence and moved to the  `return` value.

~~~javascript
function origins(entry_system) {
  var _entrys;
  if (entry_system == "created") _entrys = "Intelligent Design.";
  else if (entry_system == "chance") _entrys = "Evolution.";
  else return "Open for discussion.";
  return _entrys;
}

origins("created"); // showed me that the 'if/else if / else' conditional was met so it stopped moving down the chain.
=> Intelligent Design
~~~


#### Another gotcha 

I also noticed that a return in the else can prevent a possible, undesired 'undefined'.

~~~javascript
function origins(entry_system) {
  var _entrys;
  if (entry_system == "created") _entrys = "Intelligent Design.";
  else if (entry_system == "chance") _entrys = "Evolution.";
  else return "Open for discussion.";
  return _entrys;
}

origins("confused");
=> "Open for discussion."

function origins(entry_system) {
  var _entrys;
  if (entry_system == "created") _entrys = "Intelligent Design.";
  else if (entry_system == "chance") _entrys = "Evolution.";
  else "Open for discussion."; // removed the explicit return
  return _entrys;
}

origins("confused");
=> undefined
~~~
If you don't put a `return`, then the return of `_entrys` is `undefined`.


JS return values chain well

Make an array

~~~javascript
var a = []
=> []
~~~

And a function that returns the array

~~~javascript
var b = function(){ return a }
=> function (){ return a }
~~~

Invoking the function will return an array

~~~javascript
b()
=> []
~~~

Since an Array is the return value of that function, I can chain Array methods to the function



~~~javascript
b().push(1)
=> 1
~~~

Moreso, that method actually influenced the `a` array;


~~~javascript
a
=> [1]
~~~

Think of the possibilities...
