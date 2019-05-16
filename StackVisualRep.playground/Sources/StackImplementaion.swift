import Foundation

public struct Stack<T>{
  
  public var container = [T]()
  
  public init (){}
  
  public var isEmpty:Bool {
    return container.isEmpty
  }
  
  public var peek:T? {
    return container.last
  }
  public var count: Int {
    return container.count
  }
  public mutating func push(value:T){
    container.append(value)
  }
  public mutating func pop() -> T? {
    return container.popLast()
  }
  
}
