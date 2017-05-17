import UIKit

class VMovements:VView
{
    private(set) weak var viewField:VMovementsField!
    private weak var controller:CMovements!
    private weak var viewMenu:VMovementsMenu!
    private let kFieldHeight:CGFloat = 75
    private let kFieldTop:CGFloat = 20
    private let kMenuHeight:CGFloat = 52
    private let kAnimationDuration:TimeInterval = 0.1
    
    override init(controller:CController)
    {
        super.init(controller:controller)
        self.controller = controller as? CMovements
        
        let viewField:VMovementsField = VMovementsField(controller:self.controller)
        self.viewField = viewField
        
        let viewMenu:VMovementsMenu = VMovementsMenu(controller:self.controller)
        self.viewMenu = viewMenu
        
        addSubview(viewMenu)
        addSubview(viewField)
        
        NSLayoutConstraint.topToTop(
            view:viewField,
            toView:self,
            constant:kFieldTop)
        NSLayoutConstraint.height(
            view:viewField,
            constant:kFieldHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewField,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:viewMenu,
            toView:viewField)
        NSLayoutConstraint.height(
            view:viewMenu,
            constant:kMenuHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewMenu,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
