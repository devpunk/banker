import UIKit

class CTags:CController
{
    private weak var viewTags:VTags!
    
    override func loadView()
    {
        let viewTags:VTags = VTags(controller:self)
        self.viewTags = viewTags
        view = viewTags
    }
}
