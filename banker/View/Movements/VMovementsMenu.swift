import UIKit

class VMovementsMenu:UIView
{
    private weak var controller:CMovements!
    private weak var viewType:VMovementsMenuType!
    private let kBackWidth:CGFloat = 50
    private let kBorderHeight:CGFloat = 1
    private let kTypeWidth:CGFloat = 200
    private let kTypeRight:CGFloat = -10
    private let kTypeVertical:CGFloat = 10
    
    init(controller:CMovements)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let border:VBorder = VBorder(color:UIColor.black)
        
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
        backButton.addTarget(
            self,
            action:#selector(actionBack(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let viewType:VMovementsMenuType = VMovementsMenuType(controller:controller)
        self.viewType = viewType
        
        addSubview(border)
        addSubview(backButton)
        addSubview(viewType)
        
        NSLayoutConstraint.equalsVertical(
            view:backButton,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:backButton,
            toView:self)
        NSLayoutConstraint.width(
            view:backButton,
            constant:kBackWidth)
        
        NSLayoutConstraint.topToTop(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        NSLayoutConstraint.equalsVertical(
            view:viewType,
            toView:self,
            margin:kTypeVertical)
        NSLayoutConstraint.rightToRight(
            view:viewType,
            toView:self,
            constant:kTypeRight)
        NSLayoutConstraint.width(
            view:viewType,
            constant:kTypeWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: actions
    
    func actionBack(sender button:UIButton)
    {
        controller.back()
    }
}
