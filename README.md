# Metrics Analytics Service

<img align="right" src="http://image.ibb.co/n8HRHH/Peek_2018_04_04_12_07.gif">

## What is Metrics?

Metrics is an **analytics service** that receives events (button click, page load etc..) that occur on other websites and sort that data into graphs. All a user has to do is create an account, register an application (their website they want to track) and paste a javascript snippet into their website. Data that the user wants to track is then automatically sent over to Metrics and displayed in the form of graphs.

**Javascript snippet to start tracking events on your website:**
```
var Metrics = {};

Metrics.report = function(eventName){
  var event = {event: { name: eventName }};

  var request = new XMLHttpRequest();
  request.open("POST", "http://localhost:3000/api/events", true);
  request.setRequestHeader('Content-Type', 'application/json');
  request.send(JSON.stringify(event));
};
```

## Features

* Sign up for a free account by providing a name, password, and email 
* Sign in and out of Metrics 
* Register an application with Metrics for tracking 
* Associate events with registered applications 
* Receive incoming events in an API controller 
* Use javascript to capture client-side events in an application 
*  View a graph of events for each registered application 

## Technologies
**CORS** to allow cross-site HTTP requests for the API & **XMLHttpRequest** to make the requests from external applications

**Languages and Frameworks:** Ruby, Ruby on Rails, Javascript

**Libraries:** jQuery, Bootstrap

