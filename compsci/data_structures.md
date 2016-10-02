# Data Structures

- Different methods of storing and organising data

## Algorithms

- A set of instructions to be performed
- Data Structures are implemented with algorithms, algorithms are implemented
with data structures
- Decide on a case by case basis what algorithms to use
- We compare algorithmic performance using 'Big-O' which takes into account
the algorithms average and worst-case performances

## Big-O

- Classifying algorithms by how the respond to the (n)umber of items you give
them
- Time complexity: the total count of operations the algorithm will perform
- Space complexity: the total memory an algorithm will take up

### From good to bad

- Constant O(1)
- Logarithmic O(log N)
- Linear O(N)
- Linearithmic O(N log N)
- Polynomial O(N^2)
- Exponential O(2^N)
- Factorial O(N!)

---

- Data structures enable four primary actions: Accessing, Searching, Inserting
and Deleting.
- A structure might be good at one thing and bad at others
- e.g. an Array: Accessing [O(1)], Searching [O(N)], Inserting [O(N)],
  Deleting [O(N)]
- e.g. a Linked List: Accessing [O(N)], Searching [O(N)], Inserting [O(1)],
  Deleting [O(1)]
- e.g. a Binary Search Tree: All actions = [O(log N)]

---

## Memory

- Ordered slots where you can store information
- Hold on to memory addresses to find information
- An array/list has fast memory access because you keep track of the address
of the list directly

## Lists

- Great for fast access and dealing with end item
- Not so great dealing with items not at the end of the list and we have to
  manually have to hold onto memory addresses

```javascript

class List {
  constructor() {
    this.memory = []
    this.length = 0
  }

  // O(1) _constant_ because we have the exact memory address in storage.
  get(address) {
    return this.memory[address];
  }

  // O(1) _constant_ because we have the direct length of the array in storage
  // Not at all concerned with the rest of the list.
  push(value) {
    this.memory[this.length] = value
    this.length++
  }

  // O(1) _constant_ because all we need to do is remove the value at the address
  // at the end of our list. Not concerned with the rest of the list.
  pop(value) {
    if (this.length === 0) return

    const lastAddress = this.length - 1
    const value = this.memory[lastAddress]
    delete this.memory[lastAddress]
    this.length--

    return value
  }

  // To slide items back and forth to make room/remove room at the start of the
  // list, we need to iterate over all the other items in the list to move them,
  // this is _linear_ O(N) because the step is taken for every item in the list.
  unshift(value) {
    let previous = value

    for (let address = 0; address < this.length; address++) {
      let current = this.memory[address]
      this.memory[address] = previous
      previous = current
    }

    this.memory[this.length] = previous
    this.length++
  }

  shift() {
    if (this.length === 0) return

    const value = this.memory[0]

    for (let address = 0; address < this.length; address++) {
      this.memory[address] = this.memory[address + 1]
    }

    delete this.memory[this.length - 1]
    this.length--

    return value
  }
}
```

## Hash Tables

- Can add, access and remove values without needing to know memory addresses
- Unordered data structure
- Keys and values where compute an address in memory using the key

```javascript

class HashTable {
  constructor() {
    this.memory = []
  }

  // To turn a key into an address for storage purposes, we need to hash.
  // Take a key and serialise it into a unique number
  // With large keys you need to avoid matching it to a memory address that
  // does not exist, so the hashing algorithm must limit the size.
  // A limited amount of address for an unlimited amount of values, this can
  // cause collisions

  hashKey(key) {
    let hash = 0
    for (let index = 0; index < key.length; index++) {
      let code = key.charCodeAt(index)
      hash = ((hash << 5) - hash) + code | 0
    }

    return hash
  }

  // Access values by their key.
  // O(1) Constant
  get(key) {
    // Turn key into address
    const address = this.hashKey(key)
    // Return whatever is at that address
    reutrn this.memory[address]
  }

  // Set values, O(1) Constant
  set(key, value) {
    const address = this.hashKey(key)
    this.memory[address] = value
  }

  // Delete items, constant O(1)
  remove(key) {
    const address = this.hashKey(key)
    if (this.memory[address]) {
      delete this.memory[address]
    }
  }
}
```

## Stack

- Created using other data structures
- Similar to a list in that they are ordered, but you can only push and pop
values at the end of the list.
- Used in places where you have one process adding items to the stack, and
  another process removing them fro the end. Prioritising items added most
  recently.

```javascript

class Stack {
  constructor() {
    this.list = []
    this.length = 0
  }

  push(value) {
    this.length++
    this.list.push(value)
  }

  pop() {
    if (this.length === 0) return
    this.length--
    return this.list.pop()
  }

  // Review the item at the top of the stack without removing it
  peek() {
    return this.list[this.length - 1]
  }
}
```

## Queue

- Complimentary to a stack
- Remove items from start of queue rather than the end, removing oldest item
  rather than the most recent.
- Linked Lists allow us to implement a much faster Queue

```javascript

class Queue {
  constructor() {
    this.list = []
    this.length = 0
  }

  // Push values to end of list
  enqueue(value) {
    this.length++
    this.list.push(value)
  }

  // Remove item from start of list
  dequeue() {
    if (this.length === 0) return

    this.length
    return this.list.shift()
  }

  peek() {
    return this.list[0]
  }
}
```

---

- Data Structures where the values of a data structure reference one another
- Values inside a data structure become their own mini data structure, containing
  a value along with additional info including references to other item with the
  overall data structure
- A graph is used to optimise for the connections _between_ data rather than
  operating on the data itself. Finding all the related items for a node, like
  a user's friensd, the dependencies in a node folder, etc.

## Graphs

```javascript

class Graph {
  constructor() {
    this.nodes = []
  }

  addNode(value) {
    this.nodes.push({
      value: value,
      lines: []
    })
  }

  find(value) {
    return this.nodes.find(node =>
      node.value === value
    )
  }

  // Connect two 'nodes' by making a 'line' from one to the other
  addLine(startVal, endVal) {
    // Find the nodes for each value.
    let startNode = this.find(starVal)
    const endNode = this.find(endVal)

    if (!startNode || !endNode) {
      throw new Error('Both nodes need to exist!')
    }

    // Add a reference to endNode from the startNode
    startNode.lines.push(endNode)
  }
}
```

```javascript

// Use a graph like so:

let graph = new Graph()
graph.addNode(1)
graph.addNode(2)
graph.addLine(1, 2)
const two = graph.find(1).lines[0]
```

## Linked Lists

- Used to implement other data structures because of its ability to efficiently
add items to the start, middle, and end.
- Similar concept to a graph where nodes point to other nodes

```javascript

{
  value: 1,
  next: {
    value: 2,
    next: {
      value: 2,
      next: {...}
    }
  }
}
```

```javascript

class LinkedList {
  // A single node that starts off the chain
  constructor() {
    this.head = null
    this.length = 0
  }

  get(position) {
    if (position >= this.length) {
      throw new Error('Position outside of list range.')
    }

    let current = this.head

    for (let index = 0; index < position; index++) {
      current = current.next
    }

    return current
  }

  add(value, position) {
    let node = {
      value: value,
      next: null
    }

    if (position === 0) {
      node.next = this.head
      this.head = node
    } else {
      let prev = this.get(position - 1)
      const current = prev.next
      node.next = current
      prev.next = node
    }

    this.length++
  }

  remove(position) {
    if (position === 0) {
      this.head = this.head.next
    } else {
      let prev = this.get(position - 1)
      pre.v.next = prev.next.next
    }

    this.length--
  }
}
```

## Trees

- Trees are Unidirectional, no loops of reference
- Optimise searching and sorting, organise programs better
- Single parent acts as the root

```javascript

class Tree {
  constructor() {
    this.root = null
  }

  traverse(callback) {
    function walk(node) {
      callback(node)
      node.children.forEach(walk)
    }

    walk(this.root)
  }

  add(value, parentValue) {
    const newNode = {
      value: value,
      children: []
    }

    if (this.root === null) {
      this.root = newNode
      return
    }

    this.traverse(node => {
      if (node.value === parentValue) {
        node.children.push(newNode)
      }
    })
  }
}
```

### Binary Search Tree

- One of the most basic trees you can have
- Efficiently access, search, insert and delete values whilst keeping them
  in a sorted order
- Each node can have two children
  - left: less than parent nodes value
  - right: greater than parent nodes value
- All values in the tree must be unique

```javascript

class BinarySearchTree {

  constructor() {
    this.root = null
  }

  contains(value) {
    let current = this.root

    while (current) {
      if (value > current.value) {
        current = current.right
      } else if (value < current.value) {
        current = current.left
      } else {
        return true
      }
    }

    return false
  }

  add(value) {
    const node = {
      value: value,
      left: null,
      right: null
    }

    if (this.root === null) {
      this.root = node
      return
    }

    let current = this.root

    while(true) {
      if (value > current.value) {
        if (!current.right) {
          current.right = node
          break
        }

        current = current.right
      } else if (value < current.value) {
        if (!current.left) {
          current.left = node
          break
        }
      } else {
        break
      }
    }
  }
}
```
