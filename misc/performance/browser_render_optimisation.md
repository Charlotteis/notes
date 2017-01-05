_For the [Browser] Render Optimisation course_

# Notes

- The goal is to achieve 60 frames per second (fps)
- Visual changes means new frames presented
- Most modern devices refresh 60 times a second (60 Hz)
- If a browser takes too long to make a frame, it will be missed out
- We have 16ms to render a frame, if we want to render at 60fps
- Incorporating other work the browser has to do, it's more like 10-12ms

## To render a single frame:

- Browser makes a get request
- Request returns an HTML response
- Browser parses the document ahead of time and returns a list of nodes called
  the DOM
  - This action is called 'ParseHTML' in Dev Tools
- The DOMTree and CSS are combined to create a Render Tree
  - This action is called 'Recalculate Styles'
  - The render tree is made up visible content (i.e no Head, no Scripts)
- Next, the browser calculates the layout, how much space each element needs
  and where the element should be placed
  - This action is called 'Layout' or 'Reflow'
- Initially, the elements are vectors. We know the size and shape of them. But
  now we need to turn them into rasters, filling in the individual pixels
  of the shapes. It needs to draw the paths of the shape, draw the text
  within the shape etc. During this process it may have to decode and resize
  images, further complicating the process (an action called 'Image Decode')
  - This action is called 'Paint'
  - There can be multiple composite layers. Layer management is a part of
    making your site performant, you have to be careful not to create extra
    layers
- The majority of these process up until the Paint happens on the CPU (Central
  Processing Unit). These layers are sent to the GPU (Graphics Processing Unit)
  and it is also the GPU that takes care of displaying layers on screen

- CSStriggers.com will let you know which style changes require the most work
- We should avoid paint & layout wherever possible
- `transform` and `opacity` are the best properties to change because they only
  trigger the Composite action

## Application Lifecycles

- RAIL: Response, Animations, Idle, Load
  - Load, Idle, Animation, Response (the right order)

### Load & Idle

- Users want to load quickly
- Initial load should be done in one second, critical resources only
- After load, the app is idle and waiting for user interaction
- In the idle blocks, we can do things we deferred to get that one second page
  load
- Image assets, videos and comments sections can be loaded later
- Idle actions should only be done in 50ms chunks

### Response

- React to user input without delay
- Need to respond within 100ms

### Animation

- Animation must be responsive in less than 16ms to get 60fps
- FLIP: First Last Invert Play
  - Calculate the animations first position
  - Calculate the animations last position
  - Invert the animation, doing it backwards (moving last to first)
  - After that one expensive transition, you can play new animations forward
- Use `window.requestAnimationFrame()` when you want to update your animation
  on screen. It's effectively waiting a frame, so your animation appears once
  changing style properties through JavaScript
- Anything requiring movement or finger on screen interaction should run at
  60fps
- Avoid requesting external objects during the Animation phase (like a spinner
  .gif)

## Chrome Dev Tools

- The timeline
- Make sure to test perf on actual devices, emulation in devtools is not
  representative.
- Run timeline tests Incognito, to avoid extension interference








[Browser]: https://www.udacity.com/course/browser-rendering-optimization--ud860
