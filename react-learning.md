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

- Http
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

~~~

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
