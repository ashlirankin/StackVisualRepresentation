import UIKit

public class StackCell: UICollectionViewCell{
  
  public let titleButton: UIButton = {
    let button = UIButton()
    button.setTitle("0", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.backgroundColor = .white
    
    return button
  }()
  public override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  public override func layoutSubviews() {
    super.layoutSubviews()
    layer.cornerRadius = frame.width/2
    titleButton.layer.cornerRadius = titleButton.frame.width/2
  }
  
  func commonInit(){
    setUpViews()
  }
  
}
extension StackCell {
  func setUpViews(){
    setupTitleButton()
  }
  
  func setupTitleButton(){
    addSubview(titleButton)
    titleButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
        titleButton.centerXAnchor.constraint(equalTo: centerXAnchor),
      titleButton.centerYAnchor.constraint(equalTo: centerYAnchor),
      titleButton.heightAnchor.constraint(equalToConstant: frame.height/2),
      titleButton.widthAnchor.constraint(equalToConstant: frame.width/2)
      
      ])
  
  }
}
