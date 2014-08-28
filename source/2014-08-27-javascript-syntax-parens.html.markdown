---
title: 'JS syntax: Parens'
snip: Prep for anonymous functions and closures
image: ''
layout: blog
date: 2014-08-27 19:46 UTC
tags: javascript
---

## JS syntax: Parens

Let's start with a simple concept. 

~~~javascript
1 + 1
=> 2
~~~

Adding parens clarifies order of operations. 

~~~javascript
1 + 2 * 2
=> 5
(1 + 2) * 2
=> 6
~~~

Using parens when it's not necessary is harmless. 

~~~javascript
(1 + 1)
=> 2
~~~

#### Parens with functions
Javascript is syntax heavy so it can be difficult to know which parts are required vs. optional.

##### Anonymous functions

What happens when you want to create an free standing anonymous function?

~~~javascript
function(){ } 
=> SyntaxError: Unexpected token (
~~~

To prevent syntax error, wrap the function with parens

~~~javascript
( function(){ } )
=> function (){ }
~~~

If you want to define it, then run it, you'll need to wrap the definition in parens to separate definition from execution.

~~~javascript
(function(){})()
=> undefined
~~~
_The function body does nothing. So, here we expect the function to simple return_ `undefined`

It's a syntax error if you try to define and invoke the anonymous founction. 

~~~javascript
function(){}()
=> SyntaxError: Unexpected token (
~~~


##### Using a variable assignment

~~~javascript
var a = function(){}
=> function (){}
~~~

Calling the variable will return the function itself, which is different than invoking the function.

~~~javascript
a
=> function (){}
~~~

Add the parens if you want the function to execute. 

~~~javascript
a()
=> undefined
~~~
`undefinded` _is the function body._

Again, wrapping the whole assignment in parens does nothing.

~~~javascript
(a = function(){})
=> function (){}
~~~

_The `a =` is unecessary if you're calling it immediately_
But, you will need to wrap the declaration in parens to define it and run it at the same time.

~~~javascript
(a = function(){})()
=> undefined
~~~
_Since we are defining then immediately calling the function assigning to `a` isn't neccssary._

Which was the moment I realized the following line was productive!

~~~javascript
(function(){})()
=> undefined
~~~
