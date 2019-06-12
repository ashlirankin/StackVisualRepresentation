import UIKit

public class StackCV:UIView {
  
  public let stackCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    layout.scrollDirection = .vertical
    layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    cv.backgroundColor = .white
    cv.register(StackCell.self, forCellWithReuseIdentifier: "StackCell")
    return cv
  }()
  
  public let pushButton:UIButton = {
    let button = UIButton()
    button.backgroundColor = .white
    button.setTitleColor(.black, for: .normal)
    button.setTitle("Push", for: .normal)
    return button
  }()
  public let popButton:UIButton = {
    let button = UIButton()
    button.backgroundColor = .white
    button.setTitleColor(.black, for: .normal)
    button.setTitle("Pop", for: .normal)
    return button
  }()
  
  public override init(frame: CGRect) {
    super.init(frame: CGRect(x: 120, y: 100, width: 120, height: 400))
    backgroundColor = .white
    layer.borderWidth = 3
    layer.borderColor = UIColor.blue.cgColor
    addSubview(stackCollectionView)
    setupViews()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupViews()
  }
  
  public override func layoutSubviews() {
    super.layoutSubviews()
    stackCollectionView.center = center
    stackCollectionView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height - 50)
  }
  
}
extension StackCV{
  func setupViews(){
    pushButtonConstraint()
    popButtonConstraint()
    
  }
  func pushButtonConstraint(){
    addSubview(pushButton)
    pushButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      pushButton.topAnchor.constraint(equalTo: stackCollectionView.bottomAnchor, constant: 10),
      pushButton.widthAnchor.constraint(equalToConstant: 50)
      ])
  }
  func popButtonConstraint(){
    addSubview(popButton)
    popButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      popButton.topAnchor.constraint(equalTo: stackCollectionView.bottomAnchor, constant: 10),
      popButton.leadingAnchor.constraint(equalTo: pushButton.trailingAnchor, constant: 10),
      popButton.widthAnchor.constraint(equalToConstant: 50)
      ])
  }
}
