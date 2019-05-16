import UIKit

public class StackCell: UICollectionViewCell{
  
  let titleButton: UIButton = {
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
