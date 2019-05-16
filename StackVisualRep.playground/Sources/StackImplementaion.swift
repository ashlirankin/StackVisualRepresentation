import Foundation

public struct Stack<T>{
  
  var container = [T]()
  
  public init (){}
  
  var isEmpty:Bool {
    return container.isEmpty
  }
  
  var peek:T? {
    return container.last
  }
  
  mutating func push(value:T){
    container.append(value)
  }
  mutating func pop() -> T? {
    return container.popLast()
  }
}
