import UIKit

public class StackCV:UIView {
  
  public let titleLabel:UILabel = {
    let label = UILabel()
    label.backgroundColor = .white
    label.text = "Stack"
    label.font = UIFont(name: "Baskerville-BoldItalic", size: 49)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  
  public let stackCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    layout.scrollDirection = .vertical
    layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    cv.backgroundColor = .white
    cv.translatesAutoresizingMaskIntoConstraints = false
    cv.register(StackCell.self, forCellWithReuseIdentifier: "StackCell")
    return cv
  }()
  
  public let pushButton:UIButton = {
    let button = UIButton()
    button.backgroundColor = .white
    button.setTitleColor(.black, for: .normal)
    button.titleLabel?.font =  UIFont(name: "Baskerville-BoldItalic", size: 16)
    button.setTitle("Push", for: .normal)
    button.layer.borderWidth = 2
    button.layer.borderColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1).cgColor
    return button
  }()
  public let popButton:UIButton = {
    let button = UIButton()
    button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    button.layer.borderWidth = 2
    button.layer.borderColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1).cgColor
    button.setTitleColor(.black, for: .normal)
     button.titleLabel?.font =  UIFont(name: "Baskerville-BoldItalic", size: 16)
    button.setTitle("Pop", for: .normal)
    return button
  }()
  
  public override init(frame: CGRect) {
    super.init(frame: CGRect(x: 0, y:0, width: 400, height: 400))
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
    
  }
  
}
extension StackCV{
  func setupViews(){
    setupTitleLabeConstraint()
    setupCollectionViewConstraints()
    pushButtonConstraint()
    popButtonConstraint()
    
  }
  func setupTitleLabeConstraint(){
    addSubview(titleLabel)
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
      titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -200)
      ])
    
  }
  func setupCollectionViewConstraints(){
    addSubview(stackCollectionView)
   NSLayoutConstraint.activate([
   stackCollectionView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
        stackCollectionView.heightAnchor.constraint(equalToConstant: 300),
        stackCollectionView.widthAnchor.constraint(equalToConstant: 100),
        stackCollectionView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -200)
    ])
  }
  func pushButtonConstraint(){
    addSubview(pushButton)
    pushButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      pushButton.topAnchor.constraint(equalTo: stackCollectionView.bottomAnchor, constant: 10),
      pushButton.widthAnchor.constraint(equalToConstant: 80),
      pushButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
    ])
  }
  func popButtonConstraint(){
    addSubview(popButton)
    popButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      popButton.topAnchor.constraint(equalTo: pushButton.bottomAnchor, constant: 10),
      popButton.widthAnchor.constraint(equalToConstant: 80),
      popButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
      ])
  }
}
