# Questions

## Unanswered

- **How does React interact with a database to save state?**
- **What is React like in terms of accessibility?**
- **Can our app work without JavaScript?**

## Answered

- **What is webpack?**

  Webpack is a module loader. Since current browsers don't support the fancy `import thing from 'this/module/here'` syntax, and since you probably dont want to ship a hundred tiny files, it needs to be packaged into a bundle that a browser can deal with. Usually it ends up being one big .js file with all your modules in it. Webpack takes care that your code can still find everything as if it were still in all those tiny files.

  It also takes care of any transpiling: like ES6 to regular JavaScript, SCSS to CSS and so on. To do that it uses tools like postcss and babel.

- **How does webpack bundle things?**

  It basically replaces all your `import` statements with calls to a special `require()` function. That function will be added to your code automatically. `require()` will run the code in your module and return an object that contains everything that you `export`ed from   your module.

  It then puts all of those transformed modules into a single file (or multiple ones in more complex configurations).
