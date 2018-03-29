# Blocmetrics Analytics Service

![GIF of UX](https://image.ibb.co/mgRzen/Peek_2018_03_29_13_11.gif)

## What is Blocmetrics?

Blocmetrics is an **analytics service** that receives events (button click, page load etc..) that occur on other websites and sort that data into graphs. All a user has to do is create an account, register an application (their website they want to track) and paste a javascript snippet into their website. Data that the user wants to track is then automatically sent over to Blocmetrics and displayed in the form of graphs.

**Javascript snippet to start tracking events on your website:**
```
var blocmetrics = {};

blocmetrics.report = function(eventName){
  var event = {event: { name: eventName }};

  var request = new XMLHttpRequest();
  request.open("POST", "http://localhost:3000/api/events", true);
  request.setRequestHeader('Content-Type', 'application/json');
  request.send(JSON.stringify(event));
};
```

I created Blocmetrics as part of the [Bloc](bloc.io) full-stack web developer curriculum. I was given very little instruction for this project, but rather was given a list of user stories to accomplish.

## User Stories

| User Story    |
| ------------- |
| As a user, I want to sign up for a free account by providing a name, password, and email |
| As a user, I want to sign in and out of Blocmetrics |
| As a user, I want to register an application with Blocmetrics for tracking |
| As a user, I want events associated with registered applications |
| As a developer, I want to receive incoming events in an API controller |
| As a user, I want to use JavaScript to capture client-side events in my applicatio |
| As a user, I want to see a graph of events for each registered applications |

## Technologies

**Languages and Frameworks:** Ruby on Rails, Javascript, API(CORS/XMLHttpRequest), Bootstrap

