# React.js

## Components

- Everything in React, is a _component_
- A reusable piece of a code
- Build your own tags that delimit the component
- Separate component files
- Each component can have `props`, `state` and `context`
- If you update the state data in one place, it updates _everywhere_ the
  state is referenced
- Name your components well!
- All Components (like `class`es) start with a Capital Letter

- If all your component does is render some HTML, you don't need to create
  an entire `React.component`, instead you can use a stateless functional
  component

```javascript
// Instead of this
class Cake extends React.Component {
  render () {
    return (
      <section>
        <h2>{this.props.name}</h2>
        <p>{this.props.description}</p>
      </section>
    )
  }
}

export default Cake
```

```javascript
// Try a stateless functional component!
const Cake = (props) => {
  return (
    <section>
      <h2>{props.name}</h2>
      <p>{props.description}</p>
    </section>
  )
}

export default Cake
```

## JSX

- JSX allows us to write HTML directly in our JavaScript
- JSX can only return one parent element at a time
- have to use `className` instead of `class` because `class` is a reserved
  word

## Loading CSS

- Can do the usual `link`
- `import ./css/style.css` and webpack will load it in
- could separate css into individual components and load each in the
  individual component js file

## Props

- Pass data to components via props
- Can do prop validation to ensure the right data is passed to your
  component

```javascript
class Cake extends React.Component {
  render () {
    return (
      <h1>Cake: {this.props.name}</h1>
    )
  }
}

Cake.propTypes = {
  name: React.PropTypes.string.required
}
```

- `propTypes` can only be used in Development due to performance reasons,
  so we definitely still need to do our own client side validation (?)

## React Router

- Routing doesn't come inbuilt within React.js
- Folk tend to use `react-router` to get this done
- `react-router` shows and hides components depending on the URL you are
  visiting
- Even routing is it's own component!
