# Grids

Working through the old and new way of declaring grids in CSS.

## The old (and current) way

_For Example_: [codepen][codepen]

```html
<div id='grid'>
  <div id='one'>
    Dogs are cute
  </div>
  <div id='two'>
    Cats are cute
  </div>
  <div id='three'>
    I am cute
  </div>
</div>
```

```css
#grid {
  max-width: 1200px;
  box-sizing: border-box;
}

#one {
  background: lightblue;
}

#two {
  background: pink;
}

#three {
  background: cyan;
}

#one, #two, #three {
  float: left;
  width: 380px;
  max-width: 380px;
  padding: 10px;
  height: 50px;
}
```

The above is a fairly basic, responsive grid. As the browser gets smaller,
you will see the grid items collapse under each other. However, if we wanted
to get more complicated by have one fixed column and the others of
responsive sizes, we start to get into the territory of magic minus margins
and multiple media queries.

Grid systems at current are so complex, there are multiple tools and systems
out there for you to copy so you don't have to worry about coming up with
your own solutions.

Things can be simpler though. Enter, the new (future) way.

## The new (future) way

**NB: Codepen examples will only work if you turn on the experimental flags
in your browser, outlined in [support]**

The benefit of the new grid spec is no more magic numbers, no more floating
everywhere. The grid specs job is to help you to lay your content out by
making it's own sensible calculations without making you whip out the
calendar.

The grid items must have a containing element with `display: grid;` set on
it. We can then use `grid-template-columns` to define the exact sizes of
our grid elements.

In [this example][codepen2]: I have created a a grid of three columns.
I have set the first one to be of a fixed-width `290px` meaning it will
always be that width no matter the size of the browser. I set the second
and third columns to take up 50% of the _remaining_ space within the
`grid-container` using `0.5fr` where `fr` stands for 'fraction'.

You should notice that that columns three and five as defined by the css
IDs are actually used as gutters. In the `grid-template-columns`
specification I set these to be a width of `10px`.

I have created a grid, without use of floats and magical calculations,
in two lines of CSS!

### Magical Movement

That's not all you can do with this grid. You can make grid elements
switch places, without having to get lost in lots of positioning code!

By using `grid-column-start`, `grid-column-end`, `grid-row-start` and
`grid-row-end` you can specify where your columns sit visually, regardless
of what the HTML structure looks like. The starts and ends are a
little confusing at first, but if you read this [sitepoint][sitepoint]
article and take a look at my [example][example], things will become clear.

```html
<div id='grid'>
  <div class='grid-item' id='one'>
    A
  </div>
  <div class='grid-item' id='two'>
  </div>
  <div class='grid-item' id='three'>
    B
  </div>
  <div class='grid-item' id='four'>
  </div>
  <div class='grid-item' id='five'>
    C
  </div>
  <div class='grid-item' id='six'>
  </div>
  <div class='grid-item' id='seven'>
    D
  </div>
</div>
```

```css
#grid {
  display: grid;
  grid-template-columns: 0.25fr 10px 0.25fr 10px 0.25fr 10px 0.25fr;
  grid-template-rows: auto 20px auto;

  text-align: center;
  font-size: 25px;
  font-weight: bold;
}

#one, #three, #five, #seven {
  background: lightblue;
}

#two, #four, #six {
  background: pink;
}

#three {
  grid-column-start: 7;
  grid-column-end: 8;
  grid-row-start: 1;
  grid-row-end: 2;
}

#seven {
  grid-column-start: 3;
  grid-column-end: 4;
  grid-row-start: 1;
  grid-row-end: 2;
}
```

### Support

Support for the grid spec is, almost [zero][can i use]. For now you can
enable the grid spec in FireFox and Chrome in experimental flags. In IE
and Edge you can use the `-ms` prefix, but they support an older version
of the grid spec.

If you want to use it _now, now. now_ you can use a [polyfill], but the idea
of adding more JavaScript just to use some CSS feels icky to me.

[codepen]: http://codepen.io/Charlotteis/pen/RGWBLk
[codepen2]: http://codepen.io/Charlotteis/pen/GjpBxQ
[support]: #support
[sitepoint]: https://www.sitepoint.com/introducing-the-css-grid-layout/
[example]: http://codepen.io/Charlotteis/pen/ALWggv
[can i use]: http://caniuse.com/#feat=css-grid
[polyfill]: https://github.com/FremyCompany/css-grid-polyfill/
