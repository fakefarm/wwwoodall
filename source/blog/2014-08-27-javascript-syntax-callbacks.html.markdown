---
title: 'JS syntax: Callbacks'
snip: How functions work together
layout: blog_post
date: 2014-08-27 19:47 UTC
tags: Learning to Code
---

When I told people I was confused about callbacks I often heard 'they are  just functions'. So I couldn't figure out what my hurdle was to grasping them. 

But I figured finally got it after understanding some basic syntax. 



#### Functions use `()` for two reasons

Quick recap so we're on the same page;

##### 1. To declare arguments

~~~javascript
function hello(name){ // Parens hold arguments at design time.
  return 'hello' + name;
}
~~~

##### 2. To invoke the function

~~~javascript
  sign_out() // Parens set the function in motion.
~~~

#### Adding a callback to a function

To use a callback in a function, the function needs to be designed for it. 
As in, the function will need to append `()` onto the argument that represents the function.

~~~javascript
// Since I want to invoke 'callback', I do two things.
// 1. Make it an argument.
// 2. Add () in the body when I call it.
function add(a, callback) { 
  return a + callback(); 
}
~~~

There is nothing special about the word `callback`. But it makes it clear that the argument will be used as a function. To make that argument act as a function, append `()` where the argument is used in the function body.

##### Sidenote silliness
I had extra clarity when I realized that adding `()'s` to a number or string would be meaningless. 

~~~javascript
// You don't use () for anything but functions.
// So, a function would not be designed to append () 
// to any non-function argument.

"blam"()    // Won't work.
4()         // Silliness
~~~

##### Write a function to use in the callback slot
Ok, let's make a function that will be passed as a callback. It is just going to return the number 2. 

~~~javascript
function two() {
  return 2;
}

two()
=> 2
~~~

Now, when used as a callback, I  enter `two` as my argument but without the `()` because the `add` function is **designed** to append them to my argument. 

So, I can write 

~~~javascript
function add(1, two); // use function 'two' but don't add '()' 
                      // because the add function does so.
=> 3
~~~

Understanding the two uses of the `()'s` gave me clarity on how functions work together.
