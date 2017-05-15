import UIKit

class MHomeMovement:MHomeProtocol
{
    var image:UIImage
    {
        get
        {
            return #imageLiteral(resourceName: "assetGenericAdd")
        }
    }
    
    var title:String
    {
        get
        {
            return NSLocalizedString("MHomeMovement_title", comment:"")
        }
    }
    
    func selected(controller:CHome)
    {
        
    }
}
