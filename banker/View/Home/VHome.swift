import UIKit

class VHome:VView
{
    private weak var controller:CHome!
    private weak var viewBar:VHomeBar!
    private weak var viewMenu:VHomeMenu!
    private weak var layoutBarTop:NSLayoutConstraint!
    private let kBarHeight:CGFloat = 170
    private let kMenuHeight:CGFloat = 60
    
    override init(controller:CController)
    {
        super.init(controller:controller)
        self.controller = controller as? CHome
        
        let background:VHomeBackground = VHomeBackground()
        
        let viewBar:VHomeBar = VHomeBar(controller:self.controller)
        self.viewBar = viewBar
        
        let viewMenu:VHomeMenu = VHomeMenu(controller:self.controller)
        self.viewMenu = viewMenu
        
        addSubview(background)
        addSubview(viewBar)
        addSubview(viewMenu)
        
        NSLayoutConstraint.topToTop(
            view:background,
            toView:viewBar)
        NSLayoutConstraint.bottomToBottom(
            view:background,
            toView:viewMenu)
        NSLayoutConstraint.equalsHorizontal(
            view:background,
            toView:self)
        
        layoutBarTop = NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:kBarHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:viewMenu,
            toView:viewBar)
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
