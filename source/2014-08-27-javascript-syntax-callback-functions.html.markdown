---
title: 'JS syntax: callbacks'
snip: Keys to the kingdom
image: 'laird.jpg'
layout: blog
date: 2014-08-27 19:47 UTC
tags: javascript
blurb: 'this is my blurb!!!'
---

When I told people I was confused about callbacks I often heard that callbacks were just functions. So I couldn't figure out what my hurdle was to grasping them. But I just had an _AH-HA!_ moment after getting a better grasp on some basic syntax. 

JavaScript functions use `()` for two different reasons. Let me recap so that we're on the same page;

### 2 reasons for ( )

**1st | Declaration** 

`()'s` contain arguments the function will need to work properly.

~~~javascript
// Example 1
function hello(name){
  return 'hello' + name;
}
~~~

**2nd | Invocation** 

`()'s` invoke the function.

~~~javascript
// Example 2
  sign_out()
~~~

#### Adding a callback to a function

To use a callback in a function, the function needs to be designed for it. 
As in, the function will need to add `()` to argument that represents the function.

~~~javascript
// Example 3
// Since I want to invoke 'callback', I do two things.
// 1. Make it an argument.
// 2. Add () in the body when I call it.
function add(a, callback) { 
  return a + callback(); 
}
~~~

There is nothing special about the word `callback`. It's not a keyword, but what I've named the argument I want to become the function. I implement the callback argument by appending `()` to where the argument is used. So, `callback()` with those parens to invoke whatever future function will be passed in there.

_I had extra clarity when I realized that adding `()'s` to a number or string would be meaningless._

~~~javascript
// Example 4
// You don't use () for anything but functions.
// So, any argument expecting something other 
// than a function would not append ()
'blam'() // Don't treat a string like a function.
4() // Craziness.
~~~

##### A function to use for the callback
Here's a function to use in the `callback` slot that just returns the number 2. 

~~~javascript
function two() {
  return 2;
}

two()
=> 2
~~~

Now, when I use that as part of my callback, I will enter `two` as my argument of the `add` function without the `()` because the `add` function is designed to append them to my argument. 

So, I can write 

~~~javascript
function add(1, two); // use function 'two' but don't add '()' 
                      // because the add function does so.
=> 3
~~~

It was when and where to add parens that were tripping me up with callbacks. 
Now that I have clarity on the two uses of the `()'s`, I am able to see how the two different purposes work together to create callbacks.
