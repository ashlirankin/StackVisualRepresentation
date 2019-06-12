# Stack Visual Representation

## What are Stacks

Stacks are abstract Data Structrues. This means they are natively in a programming language such as Swift. Stacks also follow  LIFO (Last in first out), what this means is the last item that is entered into the Stack is the first item to the leave the stack. 

### Methods

Stacks are used to enforce the way data is acessed. They are created using arrays as containers. Having arrays as the data container provides with certain properties and methods for free. Methods such append and popLast. And properties such as isEmpty. 

#### Push

``` swift
 public mutating func push(value:T){
    container.append(value)
  }
  ```
#### Pop

```swift  
public mutating func pop() -> T? {
    return container.popLast()
  }
```
#### Peek
  This method allows to take a look at the item on the top of the stack with out removing the item
```swift
public var peek:T? {
    return container.last
  }
```
## Demonstration 
![gif](https://github.com/Ashlirankin18/StackVisualRepresentation/blob/master/StackVisualRepresentation.gif)
