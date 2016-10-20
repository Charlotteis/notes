# Questions

## Unanswered

- **How does React interact with a database to save state?**
- **What is React like in terms of accessibility?**
- **How do you write tests for React?**

## Answered

- **What is webpack?**

  _Answered by @lnwdr_

  Webpack is a module loader. Since current browsers don't support the fancy `import thing from 'this/module/here'` syntax, and since you probably dont want to ship a hundred tiny files, it needs to be packaged into a bundle that a browser can deal with. Usually it ends up being one big .js file with all your modules in it. Webpack takes care that your code can still find everything as if it were still in all those tiny files.

  It also takes care of any transpiling: like ES6 to regular JavaScript, SCSS to CSS and so on. To do that it uses tools like postcss and babel.

- **How does webpack bundle things?**

  _Answered by @lnwdr_

  It basically replaces all your `import` statements with calls to a special `require()` function. That function will be added to your code automatically. `require()` will run the code in your module and return an object that contains everything that you `export`ed from   your module.

  It then puts all of those transformed modules into a single file (or multiple ones in more complex configurations).

- **Can our app work without JavaScript?**

  React itself [doesn't need a Browser](https://facebook.github.io/react/docs/environments.html), which means you can [set up server-side rendering](https://reactjsnews.com/isomorphic-javascript-with-react-node). This will transform your React app in a regular server-side app. There are some tradeoffs for that, not all libraries in the React ecosystem can work in a Node environment. Alternatively, if your biggest constrain is SEO, you can set up a mininal server-side app that renders relevant data in a `<noscript>` tag, [like Discourse does](https://eviltrout.com/2013/06/19/adding-support-for-search-engines-to-your-javascript-applications.html).
