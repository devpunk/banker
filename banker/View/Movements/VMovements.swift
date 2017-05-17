import UIKit

class VMovements:VView
{
    private weak var controller:CMovements!
    private weak var viewField:VMovementsField!
    private weak var viewMenu:VMovementsMenu!
    private weak var layoutFieldHeight:NSLayoutConstraint!
    private let kFieldHeight:CGFloat = 70
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
        layoutFieldHeight = NSLayoutConstraint.height(
            view:viewField)
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
    
    //MARK: private
    
    private func resizeField()
    {
        let width:CGFloat = bounds.maxX
        let height:CGFloat = bounds.maxY
        let fieldHeight:CGFloat
        
        if height >= width
        {
            fieldHeight = kFieldMaxHeight
        }
        else
        {
            fieldHeight = kFieldMinHeight
        }
        
        layoutFieldHeight.constant = fieldHeight
        
        UIView.animate(
            withDuration:kAnimationDuration,
            animations:
            { [weak self] in
                
                self?.layoutIfNeeded()
            })
        { [weak self] (done:Bool) in
            
            let _:Bool? = self?.viewField.becomeFirstResponder()
        }
    }
    
    //MARK: public
    
    func viewAppeared()
    {
        resizeField()
    }
    
    func orientationChange()
    {
        resizeField()
    }
}
