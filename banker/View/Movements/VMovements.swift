import UIKit

class VMovements:VView
{
    private weak var controller:CMovements!
    private weak var viewField:VMovementsField!
    private weak var layoutFieldHeight:NSLayoutConstraint!
    private let kFieldMaxHeight:CGFloat = 125
    private let kFieldMinHeight:CGFloat = 65
    private let kBorderHeight:CGFloat = 1
    private let kAnimationDuration:TimeInterval = 0.1
    
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
