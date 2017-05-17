import UIKit

class VTags:VView
{
    private weak var controller:CTags!
    
    override init(controller:CController)
    {
        super.init(controller:controller)
        self.controller = controller as? CTags
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
