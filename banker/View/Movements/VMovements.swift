import UIKit

class VMovements:VView
{
    private weak var controller:CMovements!
    
    override init(controller:CController)
    {
        super.init(controller:controller)
        self.controller = controller as? CMovements
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
