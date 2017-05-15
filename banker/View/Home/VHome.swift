import UIKit

class VHome:VView
{
    private weak var controller:CHome!
    private weak var viewBar:VHomeBar!
    private weak var layoutBarTop:NSLayoutConstraint!
    private let kBarHeight:CGFloat = 180
    
    override init(controller:CController)
    {
        super.init(controller:controller)
        self.controller = controller as? CHome
        
        let viewBar:VHomeBar = VHomeBar(controller:self.controller)
        self.viewBar = viewBar
        
        addSubview(viewBar)
        
        layoutBarTop = NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:kBarHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
