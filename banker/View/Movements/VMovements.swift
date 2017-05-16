import UIKit

class VMovements:VView
{
    private weak var controller:CMovements!
    private weak var viewField:VMovementsField!
    private weak var layoutFieldHeight:NSLayoutConstraint!
    
    override init(controller:CController)
    {
        super.init(controller:controller)
        self.controller = controller as? CMovements
        
        let viewField:VMovementsField = VMovementsField(controller:self.controller)
        self.viewField = viewField
        
        addSubview(viewField)
        
        NSLayoutConstraint.topToTop(
            view:viewField,
            toView:self)
        layoutFieldHeight = NSLayoutConstraint.height(
            view:viewField)
        NSLayoutConstraint.equalsHorizontal(
            view:viewField,
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
        let textHeight:CGFloat
        
        if height >= width
        {
            textHeight = kTextMaxHeight
        }
        else
        {
            textHeight = kTextMinHeight
        }
        
        layoutTextHeight.constant = textHeight
        
        UIView.animate(
            withDuration:kAnimationFastDuration,
            animations:
            { [weak self] in
                
                self?.layoutIfNeeded()
                
            })
        { [weak self] (done:Bool) in
            
            let _:Bool? = self?.viewText.becomeFirstResponder()
        }
    }
    
    //MARK: public
    
    func viewAppeared()
    {
        resizeField()
        viewFunctions.refresh()
    }
    
    func orientationChange()
    {
        resizeField()
    }
}
