---
title: 'JS syntax: Return'
snip: Stop getting undefined
image: 'heros/canoe.jpg'
date: 2014-08-27 19:51 UTC
tags: javascript
layout: blog
published: true
---

My first programming language was Ruby. Managing a return value wasn't something I had to do. This is an example of my Ruby-inspired functions

~~~javascript
function check_box() {
  'checked';
}
check_box();
=> undefined
~~~

JavaScript doesn't consider `undefined` as an error. So, I was left scratching my head. 

With JavaScript you need to do explicitly request what you want returned with the keyword `return`

~~~javascript
function check_box() {
  return 'checked';
}
check_box();
=> checked
~~~

##### Return
Return is not only required for providing content, it's helpful to know that it will terminate the function and spit out as soon as it fires. 

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

##### Conditional shorthand

Getting comfortable with the shorthand conditional syntax. If you put the conditional on one line, the `{}` are not needed. 
Even when having multiple conditionals. 


#### Using a var
Maybe you don't want `return` to interrupt the sequence of the function. You could assign a value to a variable and return the variable at the end.

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

##### Possible gotcha

If you are using the variable approach. Be careful to notice if there are any return values _before_ returning a variable. As mentioned, `return` will exit the program immediately.

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

##### When Return doesn't return 

A return is not called on a false conditional.

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

##### Another type of undefined

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


#### return values are needed for chaining

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

More so, that method actually influenced the `a` array;

~~~javascript
a
=> [1]
~~~
