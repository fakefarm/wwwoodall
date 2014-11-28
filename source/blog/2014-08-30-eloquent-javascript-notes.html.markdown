---
title: Eloquent JavasScript
image: 'heros/fail.gif'
snip: My notes
date: 2014-08-30 00:35 UTC
tags: notes
layout: blog
published: false

---

<a id="top">
<a href="#objects">objects</a>
<span> | </span>
<a href="#debugging">debugging</a>
<span> | </span>
<a href="#http">http</a>
<span> | </span>
<a href="#functions">functions</a>
<span> | </span>
<a href="#modules">modules</a>

<a id="objects">

## Objects
_Notes from [Chapter 6](http://eloquentjavascript.net/06_object.html)_

#### Object.create()

Why use Object.create verse just normal {}?

> You can use Object.create to create an object with a specific prototype.

> We saw the Object.create function, which allows us to create an object with a specific prototype. You are allowed to pass null as the prototype to create a fresh object with no prototype. For objects like map, where the properties could be anything, this is exactly what we want.

~~~javascript
var map = Object.create(null);
map["pizza"] = 0.069;
console.log("toString" in map);
// → false
console.log("pizza" in map);
// → true
~~~

> Now we can safely use for/in loops, no matter what people have been doing to Object.prototype.

#### getPrototypeOf()

~~~javascript
console.log(Object.getPrototypeOf({}) == Object.prototype);
// → true
console.log(Object.getPrototypeOf(Object.prototype));
// → null
~~~

> As you might expect, the Object.getPrototypeOf function returns the prototype of an object.

> The prototype relations of JavaScript objects form a tree-shaped structure, and at the root of this structure sits Object.prototype. It provides a few methods that show up in all objects, such as toString, which converts an object to a string representation.


Starting to notice that JavaScript needs me to interact with the Object parent to obtain certain information.

#### Object.prototoype vs. Function.prototype

#### for/in vs. in return values.

~~~javascript
var user = {
  nazme: 'dave',
  age: 37,
  blam: function(){}
}
~~~

##### for / in 
returns a loop.

~~~javascript
for (p in user) {
  console.log(p);
  console.log(user[p]);
}
~~~

##### in

is a boolean. *NOTE* all properties are checked as a string.

~~~javascript
var c = 'blam' in user;  // blam is a function
console.log(c);
~~~

[quirks explained here](http://eloquentjavascript.net/06_object.html#p_FtECKQ2UPV)

#### Enumerable vs. NonEnumerable

JavaScript distinguishes between enumerable and nonenumerable properties.

> All properties that we create by simply assigning to them are enumerable. The standard properties in `Object.prototype` are all nonenumerable, which is why they do not show up in such a for/in loop.

> It is possible to define our own nonenumerable properties by using the `Object.defineProperty` function, which allows us to control the type of property we are creating.

~~~javascript
Object.defineProperty(Object.prototype, "hiddenNonsense", {enumerable: false, value: "hi"});
for (var name in map)
  console.log(name);
// → pizza
// → touched tree
console.log(map.hiddenNonsense);
// → hi
~~~

> So now the property is there, but it won’t show up in a loop. That’s good. But we still have the problem with the regular in operator claiming that the Object.prototype properties exist in our object. For that, we can use the object’s hasOwnProperty method.

#### hasOwnProperty()
> This method tells us whether the object itself has the property, without looking at its prototypes. This is often a more useful piece of information than what the in operator gives us.

> When you are worried that someone (some other code you loaded into your program) might have messed with the base object prototype, I recommend you write your for/in loops like this:

~~~javascript
for (var name in map) {
  if (map.hasOwnProperty(name)) {
// ... this is an own property
  }
}
~~~

#### Object.keys() 
Returns an array of property names in an object.

#### defineProperty()

#### get and set

~~~javascript
var pile = {
  elements: ["eggshell", "orange peel", "worm"],
  get height() {
return this.elements.length;
  },
  set height(value) {
console.log("Ignoring attempt to set height to", value);
  }
};

console.log(pile.height);
// → 3
pile.height = 100;
// → Ignoring attempt to set height to 100
~~~

> In object literal, the `get` or `set` notation for properties allows you to specify a function to be run when the property is read or written. 

#### instanceof 

A binary operator useful to know whether an object was derived from a specific constructor. 

~~~javascript
[1] instanceof Array;
// → true
~~~

Almost every object is an instance of Object so be aware


[grasp this](http://eloquentjavascript.net/06_object.html#p_4sWuvx6wkg)

<a id="debugging">
<a href="#top">top</a>


## Bug handling
_Notes from [Chapter 8](http://eloquentjavascript.net/08_error.html)_

#### Types of bugs it will catch

##### Syntax
##### Trying to invoke a non-function as a function
##### Calling methods on null properties.

> But often, your nonsense computation will simply produce a NaN (not a number) or undefined value. And the program happily continues, convinced that it’s doing something meaningful. The mistake will manifest itself only later, after the bogus value has traveled though several functions. It might not trigger an error at all but silently cause the program’s output to be wrong. Finding the source of such problems can be difficult.



#### Strict mode

> JavaScript can be made a little more strict by enabling strict mode. This is done by putting the string "use strict" at the top of a file or a function body. Here’s an example:

~~~javascript
function canYouSpotTheProblem() {
  "use strict";
  for (counter = 0; counter < 10; counter++)
    console.log("Happy happy");
}

canYouSpotTheProblem();
// → ReferenceError: counter is not defined
~~~

> Normally, when you forget to put var in front of your variable, as with counter in the example, JavaScript quietly creates a global variable and uses that. 
> In strict mode, however, an error is reported instead. This is very helpful. It should be noted, though, that this doesn’t work when the variable in question already exists as a global variable, but only when assigning to it would have created it.

Another change in strict mode is that the this binding holds the value undefined in functions that are not called as methods. When making such a call outside of strict mode, this refers to the global scope object. So if you accidentally call a method or constructor incorrectly in strict mode, JavaScript will produce an error as soon as it tries to read something from this, rather than happily working with the global object, creating and reading global variables.

<a id="http">
<a href="#top">top</a>


## HTTP


<a id="functions">
<a href="#top">top</a>


## Functions

<a id="modules">
<a href="#top">top</a>


## Modules
