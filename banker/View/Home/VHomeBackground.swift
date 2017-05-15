import UIKit

class VHomeBackground:UIView
{
    private let kLocationTop:NSNumber = 0
    private let kLocationBottom:NSNumber = 1
    
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        
        guard
            
            let gradientLayer:CAGradientLayer = self.layer as? CAGradientLayer
            
        else
        {
            return
        }
        
        let topColor:CGColor = UIColor.bankerGray.cgColor
        let bottomColor:CGColor = UIColor(
            red:0.047058823529412,
            green:0.141176470588235,
            blue:0.196078431372549,
            alpha:1).cgColor
        
        gradientLayer.locations = [
            kLocationTop,
            kLocationBottom]
        
        gradientLayer.colors = [
            topColor,
            bottomColor]
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override open class var layerClass:AnyClass
    {
        get
        {
            return CAGradientLayer.self
        }
    }
}
