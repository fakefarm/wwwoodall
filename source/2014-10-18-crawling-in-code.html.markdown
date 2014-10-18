---
title: Crawling in Code
snip: How to read code
image: 'heros/driving.gif'
layout: blog
caption: ''
date: 2014-10-18 17:18 UTC
tags: growth
published: true
---

I am reading [eloquent javascript](http://www.eloquentjavascript.com) and came across an example of the reduce method.

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

The above code made my eyes glaze over.

I read a few more paragraphs and realized these code blocks were the point of the book. Ugh. Either I neeed to read them or I should stop reading the book entirely.  

I took a moment to think why those blocks were making me glossy-eyed. It was because I didn't understand them. I was trying to read a sentence before I fully understood the individual words.

#### Verbs Vs. Variables

Comparing Code to English helped give me an analogy to ramp up my comprehension.
English is composed of verbs, nouns, adjectives, and punctuation. A computer is similar. But the computer's grammer is not named as such. Computer grammar is composed of variables, functions, arguments, keywords, and syntax. 

One difference though is that you you might be able to speak English without learning to read or write it. You can't get by just 'speaking' programming. you need to know how to read and write it. So, you need to get into the details.

#### Crawling in Code
You have to crawl before you can run. Crawling in code means taking the time to read word by word and say to yourself what it is. 

For example with the above code I did something like;


~~~javascript
function                // starts a function
reduce                  // name of function
(array, combine, start) // arguments the function needs
{                       //  start function's guts
var current             // sets a variable
= start;                // argument passed, that 'current' will be
                        // all the way down...
~~~

Once you know the syntax and it's purpose, you can comprehend larger concepts, quicker. You'll know which words are there for structure and which are there for meaning.
