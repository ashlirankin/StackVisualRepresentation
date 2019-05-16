import UIKit
import PlaygroundSupport

public class StackVisualViewController:UIViewController {
  
  var stackCV = StackCV()
    
  
  override public func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(stackCV)
    view.backgroundColor = .orange
    stackCV.stackCollectionView.dataSource = self
    stackCV.stackCollectionView.delegate = self
  }
  
 
}
extension StackVisualViewController:UICollectionViewDataSource{
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = stackCV.stackCollectionView.dequeueReusableCell(withReuseIdentifier: "StackCell", for: indexPath) as? StackCell else {fatalError("No StackCell found")}
    cell.backgroundColor = .blue
    return cell
  }
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1
  }
}
extension StackVisualViewController:UICollectionViewDelegateFlowLayout{
  public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 20, height: 20)
  }
}
let viewController = StackVisualViewController()
PlaygroundPage.current.liveView = viewController
