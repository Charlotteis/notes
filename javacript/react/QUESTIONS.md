# Questions

## Unanswered

- **What is React like in terms of accessibility?**
- **How do you write tests for React?**

## Answered

- **How does React interact with a database to save state?**

  _Answered by @lnwdr_

  It doesn't. React itself is only concerned with rendering. You will
  have to add your own persistence.

  Redux can certainly help (and is the way to go) with that but that's
  probably off topic here. A straightforward way to talk to a backend API
  (or local storage) is to have an object that does only that. I like to
  call those 'services'. For example, a `UserService` could have a
  `getUserProfile` method that fetches the data from wherever it needs to.
  In your `UserProfile` react component, you would call this in the
  `componentDidMount` and `componentWillReceiveProps` hooks and update the
  component's state accordingly.

  _Answered by @Charlotteis_

  Here are two (of several) possible ways that you can persist state:

  ### Firebase

  - Uses HTML5 WebSockets
  - Gives us a backend database we can work with in _real time_
  - Use the `re-base` npm package to work with React & Firebase
  - Using the `componentWillMount` and `componentWillUnmount` methods
    within my component, I can sync all data within my app with the data
    in my Firebase app and vice versa

  ### Local Storage

  - HTML Local Storage
  - Is an object
  - Can only store strings within it, no objects
  - Good for things specific to the user, like _potential_ order placement
  - `componentWillUpdate` invoked when props or stage changes
  - `localStorage.setItem(key, value)`
  - `localStorage.getItem(key)`

- **What is webpack?**

  _Answered by @lnwdr_

  Webpack is a module loader. Since current browsers don't support the fancy
  `import thing from 'this/module/here'` syntax, and since you probably
  don't want to ship a hundred tiny files, it needs to be packaged into a
  bundle that a browser can deal with. Usually it ends up being one big .js
  file with all your modules in it. Webpack takes care that your code can
  still find everything as if it were still in all those tiny files.

  It also takes care of any transpiling: like ES6 to regular JavaScript,
  SCSS to CSS and so on. To do that it uses tools like postcss and babel.

- **How does webpack bundle things?**

  _Answered by @lnwdr_

  It basically replaces all your `import` statements with calls to a special
  `require()` function. That function will be added to your code
  automatically. `require()` will run the code in your module and return an
  object that contains everything that you `export`ed from your module.

  It then puts all of those transformed modules into a single file (or
  multiple ones in more complex configurations).

- **Can our app work without JavaScript?**

  _Answered by @skiant_

  React itself [doesn't need a Browser][no browser], which means you can
  [set up server-side rendering][server-side rendering]. This will transform
  your React app into a regular server-side app. There are some tradeoffs
  for that, not all libraries in the React ecosystem can work in a Node
  environment.

  Alternatively, if your biggest constrain is SEO, you can set up a minimal
  server-side app that renders relevant data in a `<noscript>` tag,
  [like Discourse does][SEO].

[no browser]: https://facebook.github.io/react/docs/environments.html
[server-side rendering]: https://reactjsnews.com/isomorphic-javascript-with-react-node
[SEO]: https://eviltrout.com/2013/06/19/adding-support-for-search-engines-to-your-javascript-applications.html
