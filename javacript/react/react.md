# React.js

- Rather than constantly manipulate the DOM directly on data changes, React
  rerenders the component that data pertains to
- React has a fake representation of the DOM, called the _virtual DOM_,
  which allows us to describe our HTML in JavaScript and React will do the
  hard work to make sure this gets made into real HTML later

## Components

- Everything in React, is a _component_
- A reusable piece of a code
- Single Responsibility Principle: each component should do one thing
- If a component can simultaneous do things (show task, edit task) then
  we could feasibly split that into a container with two child components:
  i.e `TaskToggle` > `ShowTask`, `EditTaskatom`
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
- React elements are immutable. Once you create an element, you can't
  change its children or attributes.
- Only elements created via a class can have local state
- Class components should always call the base constructor with props

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

- JSX looks like HTML but it is not HTML
- JSX gets transpiled into JavaScript functions by [babel]
- The [Babel REPL] demonstrates the JSX to JavaScript transformation
- JSX helps you to visualise the layout of your component
- Having JSX close to the code that interprets properties and reacts to state changes makes it easy to reason about the behaviour and appearance of your component in isolation from the rest of your app.
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
- Props are read only
- You can only modify props by going to the source, setting the state on
  the parent component

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

## Events

- Events are wrapped in cross browser thing called SyntheticEvent
- Events are done inline, unlike jQuery and listeners
- `onClick` and `onSubmit` inline
- Avoid directly manipulating the DOM, our concern is with the data

## Context

- Declaring something at the top level so as to make it available to
  everything further down the component tree
- `Cake.contextTypes`

## State

- A representation of all of the data within the app
- It's best to keep state representation both within your app, and on
  the server
- Each component can have its own state
- Updating state in one place means the update happens in all the other
  places in which that datapoint is referenced
- When updating state: get current state, update state, tell React you
  updated the state (`this.setState`)
- To tell a component it is stateful, define the `getInitialState`
  function (a lifecycle method) within the component class and return
  a non-falsey value

## React lifecycle hooks

- Entry points into a component
- During mount or rendering, for example
- Hook into that process to do certain things, like connecting to a DB
- `componentWillMount`: work with component just before it is rendered
- `componentWillUpdate` invoked when props or stage changes

## Animations

- `import CSSTransitionGroup from 'react-addons-css-transition-group'`
- `<CSSTransitionGroup>`, once named, provides us with classes that are
  added and removed during the transition. We can hook into these to
  display our CSS animations

```javascript
<CSSTransitionGroup
  component='span'
  className='count'
  transitionName='count'
  transitionEnterTimeout={250}
  transitionLeaveTimeout={250}>
  <span key={count}>{count}</span>
</CSSTransitionGroup>
```

```css
.count-enter {
  &.count-enter-active {

  }
}

.count-leave {
  &.count-leave-active {

  }
}
```

## Productionising

- use the `react-scripts` module `build` command to make optimise your app




[babel]: https://babeljs.io/
[Babel REPL]: https://babeljs.io/repl/
