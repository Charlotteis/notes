# ES6

## `let`, `const` & `var`

- `var` is function scope, meaning leakage
- `let` and `const` are block scoped
- Goodbye IFFE, hello `{let thing = 22}`
- `const` cannot be redefined
- Use `const` by default
- `let` and `const` define intention
- No more temporal d(e)adspace, cannot call a variable before it has value

## Arrow Functions

- Concise
- Implicit Returns

```javascript
// Before
var ingredients = ['butter', 'sugar', 'flour']
var cake = ingredients.map(function(ingredient) {
  return "I put " + ingredient + " into my cake."
})

console.log(cake)

// After
const ingredients = ['butter', 'sugar', 'flour']
const cake = ingredients.map(ingredient => `I put ${ingredient} into my cake.`)
```

- Can't name an arrow function, but you _can_ assign it to a variable

```javascript
// Can't do this
function cakeName(name => console.log(name)}

// Can do this
const cakeName = (name) => {console.log(name)}
```

### `this` does not get rebound

- It is inherited from the parent scope, often `window`

```javascript
// Don't do this
box.addEventListener('click', () => console.log(this))

// Do this
box.addEventListener('click', function() {
  console.log(this)
})
```

- Functions now have default arguments!

```javascript
// Used to do this
function add(num1, num2) {
  firstNum = num1 || 2
  secondNum = num2 || 3
  return firstNum + secondNum
}

console.log(add(4, 6)) // -> 10
console.log(add()) // -> 5

// Now we can do this
function add2(num1 = 2, num2 = 3) {
  return num1 + num2
}

console.log(add2(4, 6)) // -> 10
console.log(add2()) // -> 5
```

- Don't use for prototype methods.
- Don't use it when you need the `arguments` object
