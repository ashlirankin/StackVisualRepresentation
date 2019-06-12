import UIKit
import PlaygroundSupport

public class StackVisualViewController:UIViewController {
  
  var stackCV = StackCV()
  var intStack = Stack<Int>()
  
  override public func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(stackCV)
    view.backgroundColor = .white
    stackCV.stackCollectionView.dataSource = self
    stackCV.stackCollectionView.delegate = self
    setButtonsFunctionality()
  }
  
  func setButtonsFunctionality(){
    stackCV.pushButton.addTarget(self, action: #selector(pushButtonPressed), for: .touchUpInside)
    stackCV.popButton.addTarget(self, action: #selector(popButtonPressed), for: .touchUpInside)
  }
  
  @objc func pushButtonPressed(){
    let value = Int.random(in: 0..<100)
    print(value)
    intStack.push(value: value)
    let indexPath = IndexPath(item: 0, section: 0)
    
    stackCV.stackCollectionView.insertItems(at: [indexPath])
  }
  @objc func popButtonPressed(){
    guard !intStack.isEmpty else {
      return
    }
    intStack.pop()
    
    let indexPath = IndexPath(item: 0, section: 0)
    
    
    
stackCV.stackCollectionView.deleteItems(at: [indexPath])
  }
}
extension StackVisualViewController:UICollectionViewDataSource{
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    print("here")
   let value  = intStack.container.reversed()[indexPath.row]
    
    guard let cell = stackCV.stackCollectionView.dequeueReusableCell(withReuseIdentifier: "StackCell", for: indexPath) as? StackCell else {fatalError("No StackCell found")}
    cell.titleButton.setTitle("\(value)", for: .normal)
    cell.backgroundColor = .blue
    return cell
  }
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return intStack.count
    
  }
}
extension StackVisualViewController:UICollectionViewDelegateFlowLayout{
  public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 50, height: 50)
  }
}
let viewController = StackVisualViewController()
PlaygroundPage.current.liveView = viewController
