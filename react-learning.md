Express
=======
https://www.tutorialspoint.com/nodejs/nodejs_express_framework.htm

questions: 
1. body-parser ? middleware
2. different ways:
3. resource <-> routers ? express.Router
4. resources -> async get|query|save|delete( pool.query (select * from ..get|query|save|delete...))



~~~js
//a
import express from 'express'
//b
const express = require('express');


// allow cors
//a
  this.app.use(cors());
//b
app.all('/api/controlsheet', function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "X-Requested-With");
    next();
   });


// db connection
//a 
const Pool = require('pg').Pool;
const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'cms',
    password: 'postgres',
    port: 5432            
});
//b 
import {Pool} from 'pg'
this.pool = new Pool(config.database);


~~~




~~~sh
# create a json package (-y, means all question answer yes)
npm init -y

# install express
npm install express

# then create file called "index.js" file

# install nodemon only for development, it can watch the server, so no need re-start on every change
npm i -D nodemon

# then edit the package.json:
#   "scripts": {
#     "start": "node index",
#     "dev": "nodemon index"
#   }

npm run dev    # this will run the dev -> nodemon index

# display the api call datetime
npm i moment

# install handlebars
npm i express-handlebars

# install db postgres
npm i -s pg

~~~







~~~js
var regex = /(\w*)(\{\$[\w,$#]+\})(\w*)/g;

var paragraph = 'The quick brown fox jumps over the lazy {$dog,#sdfsd,$we}. It barked.';
var regex = /(\w*)(\{\$[\w,$#]+\})(\w*)/g;
var regex1 = /(\w*)(\{\$[\w,$#\s-]+\})(\w*)/g;
var found = paragraph.match(regex);

console.log(found);
~~~



VirtualBox
==========
1. download Virtual box
2. download Fedora 29:
    https://tecadmin.net/download-fedora-dvd-iso-images/


React
=====

url:
https://www.youtube.com/watch?v=sBws8MSXN7A&t=130s



- JavaScript library for UIs | Client
- also called a framework (for its behavior and capabilities)
  - the V of MVC
- self contained | independent components with their own stsate
- much more interactive UIs
- Virtual DOM (only update as need of part of the page, like a form instead of the whole page)
- JSX


need to learn:
- classes
- **Destructuring**
- High order Array Methods - forEach, map, filler
- Arrow Functions
- **Fetch API & Promises**
- state manager -> Redux

React State
===========
- Components can have State:
  - which is an object that determines how that component renders and behaves
  - Applicatioin level state
    - by using a state manager like **Redux** or Reacts own **context API**


Create-React-App tool
=====================
- CLI Tool for creating React apps
- uses Webpack
- bundled with a dev server
- compile by "npm run build"


Anatomy of a Component
=======================
- state
- render


Installation
=============
- node js
- React Develoer Tools (for Chrome)
- React router

Create Project
==============
- facebook create app page: 
    https://github.com/facebook/create-react-app 

- React router (install separately)

- Http library
  - a web site for fake Rest API call: http://jsonplaceholder.typicode.com/ 

http://jsonplaceholder.typicode.com/todos

~~~sh

npx create-react-app .

cd C:\Users\tliu\Documents\tami\react-2019-tami
npm start

npm run build

# install uuid for generating the id
npm i uuid 

# install react router 
npm i react-router-dom

# install axios - http library
npm i axios


########Redux----
# install create-react-app
npm i -g create-react-app

# install redux | react-redux | redux-thunk(middleware of the redux)
npm i redux react-redux redux-thunk

# add development tool of Redux -> Google:  chrome extensions redux -> Redux devTools

~~~
Redux (with React):

- Actions
- State management
- Reducer
- Middlewaer(redux-thunk)



~~~json
  [{
    "userId": 1,
    "id": 1,
    "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
  },
  {
    "userId": 1,
    "id": 2,
    "title": "qui est esse",
    "body": "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
  }]
~~~



redux document:
---------------
Followed video: https://www.youtube.com/watch?v=93p3LxR9xfM
Documents:
https://github.com/reduxjs/redux/blob/master/docs/basics/Store.md
https://github.com/reduxjs/redux



~~~log
Initialized a git repository.

Success! Created react-2019-tami at C:\Users\tliu\Documents\tami\react-2019-tami
Inside that directory, you can run several commands:

  npm start
    Starts the development server.

  npm run build
    Bundles the app into static files for production.

  npm test
    Starts the test runner.

  npm run eject
    Removes this tool and copies build dependencies, configuration files
    and scripts into the app directory. If you do this, you can’t go back!

We suggest that you begin by typing:

  cd C:\Users\tliu\Documents\tami\react-2019-tami
  npm start
~~~

React Debug in VS code:
~~~
 npm install --save -dev redux-devtools-extension
 
~~~