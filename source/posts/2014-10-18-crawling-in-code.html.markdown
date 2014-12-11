---
title: 'Crawling in Code'
snip: How to read code
image: 'heros/driving.gif'
layout: blog_post
caption: ''
date: 2014-10-18 17:18 UTC
tags: growth
published: true
---

I am reading [Eloquent javascript](http://www.eloquentjavascript.com) and happended upon the reduce method;

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

It just made my eyes glaze over.

I read a few more paragraphs and realized these code blocks were the point of the book. Ugh. Either I need to read them or I should stop reading the book entirely.

I took a moment to think why those blocks were making me glossy-eyed. It was because I didn't understand them. I was trying to read a sentence before I fully understood individual words.

#### Verbs Vs. Variables

Comparing code to English gave me an analogy to ramp up my comprehension.
Think how English is composed of verbs, nouns, adjectives, and punctuation. A computer is similar but it's grammer is _variables_, _functions_, _arguments_, _keywords_, and _syntax_.

But while you might be able to speak English without reading or writing it, you can't get by just 'speaking' programming. You need to study the details if you are going to read and write it.

#### Crawling in Code
You have to crawl before you can run. Crawling in code means taking the time to read word by word and be able to understand it's purpose in the 'sentence'. Your mind was created in such a way that once you grasp it, you won't have to think about it again.

So, for example, with the above code I did something like;

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
