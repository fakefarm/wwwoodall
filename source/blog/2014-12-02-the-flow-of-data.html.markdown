---
title: the flow of data
snip: 'CRUD in the real world'
tags: 'site design'
type: 'journal'
format: 'text'
date: 2014-12-02 16:16 UTC
layout: notes
blog: notes
published: false
image: 'heros/joke.png'
caption: 'a photo caption goes here'
---

Learning Rails as the first thing was simple. A simple CRUD followed along with the path of Routes, Controller, Action, View (RCAV)

That was easy to remember. Working at livingSocial I've had exposure to see how impressive rails is in the convention that can be bent and changed. The pattern we use at Living Social is

1. Setup the page environment
2. Make an ajax call once the events have loaded
3. that ajax call will send to a routes
4. those routes will be directed to a proper controller and action
5. that action will request data and explain the render option
6. the return will be consumed in a partial or template, not a pure html view.

This is good to see how many ways you can do the same thing. 


