import UIKit

class VMovements:VView
{
    private weak var controller:CMovements!
    private weak var viewField:VMovementsField!
    private let kFieldHeight:CGFloat = 100
    
    override init(controller:CController)
    {
        super.init(controller:controller)
        self.controller = controller as? CMovements
        
        let viewField:VMovementsField = VMovementsField()
        
        self.viewField = viewField
        
        addSubview(viewField)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
