---
title: 'JS syntax: Arguments'
snip: Developing intuition
image: 'heros/joke.png'
caption: ''
date: 2014-08-25 14:53 UTC
layout: blog
tags: javascript
published: true
---

I wanted to learn JavaScript's `map` function so I went to [mozilla](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map). My first goal was to toy with it without getting an error.

~~~javascript
var pets = ['cat', 'dog', 'mouse', 'bird']

var more_pets = pets.map(function(value) {
    return value;
});

more_pets
=> ['cat', 'dog', 'mouse', 'bird']
~~~

Yay, I didn't break anything.

##### Compared to Ruby

Ruby will throw an error if all the arguments are not passed in. JavaScript won't do that. So, there's no error if I pass in less arguments than needed.

#### Understanding the arguments

`Map`'s documentation says it has use of four arguments. Next was to figure out what those arguments represented. Since I didn't know, I named them `(first, second, third, fourth)` and stored them in an Array to see what I got back;

~~~javascript
pets_info = pets.map(function(first, second, third, fourth){
    return [first, second, third, fourth]
})
=> [Array[4], Array[4] , Array[4] , Array[4]]
~~~

`Map` returned an Array of Arrays. Now, to see what's inside the first one;

~~~javascript
pets_info[0]
=> ["cat", 0, Array[4], undefined]
~~~

Oh now it's starting to make sense. For clarity I'll change the names of my arguments to

~~~javascript
(current_value, array_index, original_array, fourth)  
~~~
_I'm still not sure what the undefined represented so I'll leave that argument as 'fourth'_

#### Developing intuition
Learning `map` gave me an _AH-HA_ moment about programming in general. 
I used to get tripped up while pairing with an experienced developer who took educated guess at something and got it right. 

<blockquote class="twitter-tweet" lang="en"><p>&quot;How do you do that Rodge?&quot;&#10;<a href="https://t.co/uG6v0EgAIi">https://t.co/uG6v0EgAIi</a></p>&mdash; dave (@wwwoodall) <a href="https://twitter.com/wwwoodall/statuses/463406685936427008">May 5, 2014</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Turns out they knew the underlying concept that function arguments must be intentionally placed.

**Just because JavaScipt doesn't care if you _pass_ an argument, it does care which order you pass it.** 

##### Oversimplification
My introduction to arguments was something like an `add` method.

~~~ruby
def add(a,b)
  a + b
end

add(1,2)
=> 3

add(2,1) # change order same result
=> 3
~~~

Those simple examples unintentionally led me to believe that arguments were informal. That it didn't matter which way you ordered arguments.

#### Work with assumptions

Nobody innately knows how another developer's code works. The easiest way is to take a guess or two. But if you can't figure it out, then you can be assured it's documented somewhere with tests, api, proper names, or (dare I say) comments. Even though JavaScript is a dynamically typed language the arguments have to be specified.

Knowing that arguments are intentional means expecting code to follow certain patters. That other developers are going to reference my code to understand how to use it challenges me to write clean code.
