//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class CircularView: UIView {
    enum ShadowVisibility {
        case none
        case some
    }
    
    init(color: UIColor, shadowVisibility: ShadowVisibility) {
        super.init(frame: .zero)
        setup(color, shadowVisibility: shadowVisibility)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(_ color: UIColor, shadowVisibility: ShadowVisibility) {
        let visibility: Float = shadowVisibility == .none ? 0 : 0.5
        backgroundColor = color
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.masksToBounds = false
        layer.shadowRadius = 8
        layer.shadowOpacity = visibility
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.width / 2
    }
}

// How to use: Example ViewController
class MyViewController : UIViewController {
    
    let circleView = CircularView(color: .red, shadowVisibility: .some)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(circleView)
        addConstraints()
    }
    
    private func addConstraints() {
        circleView.translatesAutoresizingMaskIntoConstraints = false
        circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        circleView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        circleView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        circleView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
