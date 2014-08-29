---
title: How to read code
snip: Verbs Vs Variables
image: 'heros/driving.gif'
layout: blog
caption: ''
date: 2014-08-28 20:54 UTC
tags:
published: false
---

I am reading [eloquent javascript](http://www.eloquentjavascript.com) and came across an example of the reduce method. When I did, my eyes totally glazed over.

But, I decided to actually stop and study rather than gloss over. I figured the remaining parts of the chapter would not be any more fun to read anyway.


~~~javascript
function reduce(array, combine, start) {
  var current = start;
  for (var i = 0; i < array.length; i++)
    current = combine(current, array[i]);
  return current;
}

console.log(reduce([1, 2, 3, 4], function(a, b) {
  return a + b;
}, 0));
// → 10
~~~

#### Verbs Vs. Variables

Just as English uses verbs, nouns, adjectives, and punctuation, so does a computer. But the computer's grammar is different. A computer's grammar is variables, functions, arguments, keywords, and syntax.

Once you learn the basics, you'll start to put together more complete thoughts, just as you would in speaking a new foreign language.


During this I started to realize I was still reading code like I would read an English paragraph. I was reading like I would read a paragraph.

Reading code is not like consuming verbs, nouns, and adjectives. Code does not need those things. Code is made up of variables, keywords, functions, arguments, and syntax.

Once I realized this, I started to see how the first time I encouter a block of code, I should be getting my bearings as to what the words are, not what they represent.

So, I'm looking at general design of what's inside. 
'Variable. Okay I'll come back to that'
'This argument is a callback. Okay'
'What is the return value supposed to be?'

Then, once I get a sense of how the block flows, then I'll take another pass at what the information is doing in the flow.
