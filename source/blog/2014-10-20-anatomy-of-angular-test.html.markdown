---
title: 'An AngularJS test'
snip: Terms when first learning to test Angular.
date: 2014-10-20 22:39 UTC
tags: angular
image: 'pictures/hero.png'
caption: "Camping on Father's Day 2014"
layout: blog_post
published: true
---

After writing Angular you'll soon want to test it. Testing is when you'll encounter a second layer of terms and functionality that was designed. I had to learn some new concepts and they made my head spin. So, I am documenting here for a reminder of the parts that are necessary to test. 

Now that I've written a few tests, I see why and how it works and it's not that bad :-)

##### Step 1: require
The first thing is you need to require all the files you need.
Which will be your angular code, angular_mocks, and your code.

~~~coffeescript
#= require libraries/angular
#= require plugins/recommendations
#= require helpers/specHelper
#= require helpers/angular_mocks
#= require mocks/recommendations_mocks
~~~

##### Step 2.
Create a describe block that will wrap your suite.

~~~coffeescript
describe "Directive: recommendations", ->
~~~

##### Step 3.
  Javascript manages scope through functions, (functional scope). Each test will be it's own scope so we need to put variables at the parent scope so that the children will have access to them.

~~~coffeescript
    $injector           = undefined
    recommendations     = undefined
    mockRecommendations = undefined
    $compile            = undefined
    $rootScope          = undefined
    $scope              = undefined
    $httpBackend        = undefined
~~~

##### Step 4.
Angular will only load the modules you explicitly call.

~~~coffeescript
  beforeEach module("RecommendationMocks", "recommendationsApp")
~~~

##### Step 5.
Angular is brokend into services. These services are not loaded until you tell them to be. You have to inject the injector, then use this injector.get() syntax

~~~coffeescript
  beforeEach inject (_$injector_) ->
    $injector           = _$injector_
    $compile            = $injector.get('$compile')
    $rootScope          = $injector.get('$rootScope')
    $scope              = $rootScope.$new()
    recommendations     = $injector.get('recommendationsModel')
    mockRecommendations = $injector.get("mockRecommendations")
    $httpBackend        = $injector.get('$httpBackend')
~~~

#### Testing a Service
A service will use the HTTP to get a template, or other data.

##### Step 6.
If your service makes an HTTP request, you want need to stub it out in a before each and show that you are expecting to make the call. The call will not actually be made though because `$httpBackend` will stub it out.

~~~coffeescript
  beforeEach ->
     $httpBackend.expectGET("/browse/p.json").respond(200, angular.copy(mockRecommendations))
~~~

##### Step 7.
You then have to have an aftereacth that you didn't make more HTTP calls than expected. And that the HTTP requests resolve as expected.

~~~coffeescript
  afterEach ->
    $httpBackend.verifyNoOutstandingExpectation()
    $httpBackend.verifyNoOutstandingRequest()
~~~

##### Step 8.
The below .fetch() method is my custom code. But after you make that call, you need to flush() which connects the fetch() call with the HTTP call that the `fetch()` makes.

~~~coffeescript
  describe "Model: recommendationsModel", ->
    describe "fetch()", ->
      it "makes a GET request for recommendations", ->
        recommendations.fetch()
        $httpBackend.flush()
~~~

#### Testing a directive
A directive will be added to the html so you need to create a before each to add some html the page;

##### Step 9.
Use Jquery to add some HTML to the page

~~~coffeescript
  describe "Directive: recommendations", ->
    beforeEach ->
      $(document.body).append("
        <div id='wrapper'>
          <p id='foo'>remove me.</p>
        </div>
        ")

    afterEach ->
      $("#wrapper").remove()
~~~

##### Step 10.
Notice we are using `$compile` this service will convert the template and expressions into html. 

~~~coffeescript
    it "returns personalized recommendations", ->
      element = $compile("
        <recommendations selector='#foo'>
          <div ng-repeat='deal in deals'>{{ deal.title }}</div>
        </recommendations>
      ")($scope)
      $httpBackend.flush()
      $scope.$apply()
      expect(element.html()).toContain 'Go-karting'
      expect(element.html()).toContain 'Sushi'
~~~

##### Step 11.
Here, we use `$compile` to convert our directive into html.
Then, `$digest` attacheses it to the root scope. YOu have to do this.
~~~coffeescript
    it 'replaces an a existing element identified by selector attribute', ->
      $compile("<recommendations selector='#foo'></recommendations>")($scope)
      $rootScope.$digest()
      $httpBackend.flush()
      expect($(document.body).html()).not.toContain 'remove me.'
~~~


### Code without comments

~~~coffeescript
#= require libraries/angular
#= require plugins/recommendations
#= require helpers/specHelper
#= require helpers/angular_mocks
#= require mocks/recommendations_mocks

describe "Recommendations", ->
  $injector           = undefined
  recommendations     = undefined
  mockRecommendations = undefined
  $compile            = undefined
  $rootScope          = undefined
  $scope              = undefined
  $httpBackend        = undefined

  beforeEach module("RecommendationMocks", "app.recommendations")

  beforeEach inject (_$injector_) ->
    $injector           = _$injector_
    $compile            = $injector.get('$compile')
    $rootScope          = $injector.get('$rootScope')
    $scope              = $rootScope.$new()
    recommendations     = $injector.get('recommendationsModel')
    mockRecommendations = $injector.get("mockRecommendations")
    $httpBackend        = $injector.get('$httpBackend')

  beforeEach ->
     $httpBackend.expectGET("/browse/p.json").respond(200, angular.copy(mockRecommendations))

  afterEach ->
    $httpBackend.verifyNoOutstandingExpectation()
    $httpBackend.verifyNoOutstandingRequest()

  describe "Model: recommendationsModel", ->
    describe "fetch()", ->
      it "makes a GET request for recommendations", ->
        recommendations.fetch()
        $httpBackend.flush()

  describe "Directive: recommendations", ->
    beforeEach ->
      $(document.body).append("
        <div id='wrapper'>
          <p id='foo'>remove me.</p>
        </div>
        ")

    afterEach ->
      $("#wrapper").remove()

    it "returns personalized recommendations", ->
      element = $compile("
        <recommendations selector='#foo'>
          <div ng-repeat='deal in deals'>{{ deal.title }}</div>
        </recommendations>
      ")($scope)
      $httpBackend.flush()
      $scope.$apply()
      expect(element.html()).toContain 'Go-karting'
      expect(element.html()).toContain 'Sushi'

    it 'replaces an a existing element identified by selector attribute', ->
      $compile("<recommendations selector='#foo'></recommendations>")($scope)
      $rootScope.$digest()
      $httpBackend.flush()
      expect($(document.body).html()).not.toContain 'remove me.'
~~~
