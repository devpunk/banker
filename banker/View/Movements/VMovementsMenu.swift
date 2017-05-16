import UIKit

class VMovementsMenu:UIView
{
    private weak var controller:CMovements!
    private let kBackWidth:CGFloat = 50
    
    init(controller:CMovements)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let backButton:UIButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(
            #imageLiteral(resourceName: "assetGenericBack").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.normal)
        backButton.setImage(
            #imageLiteral(resourceName: "assetGenericBack").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
            for:UIControlState.highlighted)
        backButton.imageView!.tintColor = UIColor(white:0, alpha:0.2)
        backButton.imageView!.clipsToBounds = true
        backButton.imageView!.contentMode = UIViewContentMode.center
        
        addSubview(backButton)
        
        NSLayoutConstraint.equalsVertical(
            view:backButton,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:backButton,
            toView:self)
        NSLayoutConstraint.width(
            view:backButton,
            constant:kBackWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
