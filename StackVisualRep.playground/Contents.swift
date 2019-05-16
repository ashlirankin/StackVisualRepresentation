import UIKit
import PlaygroundSupport

public class StackVisualViewController:UIViewController {
  
  var stackCV = StackCV()
  var intStack = Stack<Int>(){
    didSet{
      stackCV.stackCollectionView.reloadData()
    }
  }
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
    intStack.push(value: Int.random(in: 0...100))
  }
  @objc func popButtonPressed(){
    intStack.pop()
  }
  func stackAnimations(cell:StackCell){
    cell.alpha = 0
    UIView.animate(withDuration: 2.0, delay: 0.5, options: [.beginFromCurrentState], animations: {
    cell.alpha = 1
    cell.transform = CGAffineTransform.init(translationX: 1, y: 100)
    }) { (sucess) in
      
    }
  }
 
}
extension StackVisualViewController:UICollectionViewDataSource{
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   let value  = intStack.container.reversed()[indexPath.row]
    guard let cell = stackCV.stackCollectionView.dequeueReusableCell(withReuseIdentifier: "StackCell", for: indexPath) as? StackCell else {fatalError("No StackCell found")}
    cell.titleButton.setTitle("\(value)", for: .normal)
    cell.backgroundColor = .blue
    stackAnimations(cell: cell)
    
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
