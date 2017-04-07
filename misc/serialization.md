# Serialization

I've just opened a cake shop! Nice.
I have a bunch of cakes, and I store the info about the cakes in a database.
I have columns for name, price, expiry date and more.

Storing the ingredients of my cakes is difficult though. Do I create a separate
`ingredients` table in my database? Then, I guess I could create a column in that
table for every single ingredient that I might ever use to make a cake?

This seems a little unmanageable. Not only will I have potentially thousands of
columns in that ingredients database, when it comes to working with all these ingredients,
it will be a lot of data munging and processing unless I am doing simple queries
directly to the database.

Rather than have a whole database of ingredients, I can have a single column in my
Cake database that reads `ingredients`. I can store the ingredients in one
object, without having to know exactly what the ingredients are. I put them in,
I take them out.

The thing that allows me to do this, is `serialization` (and it's counterpart,
`deserialization`). I need to convert my cake object into something the database
can handle, a series of bytes. This conversion is 'serialization'. Then, in order
to work with the data I've queried from the database, I convert it back to its
original state using `deserialization`.

Serialization/deserialization can be nicely done with JSON.

```javascript
const cakeIngredients = {
  'vanilla extract': '2 teaspoons',
  'chocolate': 'a whole bunch',
  'cream': 'i guess so',
  'chocolate chips': '1 handful (the hand of a bear)'
}

// Turn the JSON into a string
const serializedIngredients = JSON.stringify(cakeIngredients)
// "{"vanilla extract":"2 teaspoons","chocolate":"a whole bunch","cream":"i guess so","chocolate chips":"1 handful (hand is bear hand)"}"
// Boop boop, pretend I put serializedIngredients in a database!

// Boop boop, I wanna get the ingredients out the database, from another application!
const deserializedIngredients = JSON.parse(serializedIngredients)
```

I stored a stringified version of my ingredients into the database, and now
another application can grab those ingredients, deserialize them and work with
them without having to know the ins-and-outs of what the object contains.

Yay.
