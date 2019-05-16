import UIKit

public class StackCV:UIView {
  
  public let stackCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    layout.scrollDirection = .vertical
    layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    cv.backgroundColor = .orange
    
    cv.register(StackCell.self, forCellWithReuseIdentifier: "StackCell")
    return cv
  }()
  public override init(frame: CGRect) {
    super.init(frame: CGRect(x: 120, y: 100, width: 90, height: 400))
    backgroundColor = .black
    addSubview(stackCollectionView)
  }
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  public override func layoutSubviews() {
    super.layoutSubviews()
    stackCollectionView.center = center
    stackCollectionView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
  }
  
}
