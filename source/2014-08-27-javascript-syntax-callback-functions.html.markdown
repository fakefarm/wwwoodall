---
title: 'JS syntax: Callbacks'
snip: How functions work together
image: 'heros/photo.gif'
layout: blog
date: 2014-08-27 19:47 UTC
tags: javascript
published: true
---

When I told people I was confused about callbacks I often heard 'they are  just functions'. So I couldn't figure out what my hurdle was to grasping them. But I figured finally got it after understanding some basic syntax. 

JavaScript functions use `()` for two different reasons. Let me recap so that we're on the same page;

#### 2 reasons for ( )

##### 1. Declaration

`()'s` contain arguments the function will need to work properly.

~~~javascript
// Example 1
function hello(name){
  return 'hello' + name;
}
~~~

##### 2. Invocation

`()'s` invoke the function.

~~~javascript
// Example 2
  sign_out()
~~~

#### Adding a callback to a function

To use a callback in a function, the function needs to be designed for it. 
As in, the function will need to append `()` onto the argument that represents the function.

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
// So, a function would not be designed to append () 
// to any non-function argument.

"blam"()    // Won't work.
4()         // Silliness
~~~

##### A function to use for the callback
Ok, let's make a function that will be passed as a callback. It is just going to return the number 2. 

~~~javascript
function two() {
  return 2;
}

two()
=> 2
~~~

Now, when used as a callback, I will enter `two` as my argument but without the `()` because the `add` function is designed to append them to my argument. 

So, I can write 

~~~javascript
function add(1, two); // use function 'two' but don't add '()' 
                      // because the add function does so.
=> 3
~~~

The 'when' and 'where' to add parens that was tripping me up. Now that I have clarity on the two uses of the `()'s`, I am able to see how the two different purposes work together to create callbacks. Yay!
