import UIKit

class VHomeAdd:UIButton
{
    private weak var controller:CHome!
    
    init(controller:CHome)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        contentMode = UIViewContentMode.center
        translatesAutoresizingMaskIntoConstraints = false
        setImage(
            #imageLiteral(resourceName: "assetGenericAddOn").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.normal)
        setImage(
            #imageLiteral(resourceName: "assetGenericAddOff").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.highlighted)
        imageView!.clipsToBounds = true
        imageView!.contentMode = UIViewContentMode.center
        self.controller = controller
        
        addTarget(
            self,
            action:#selector(actionButton(sender:)),
            for:UIControlEvents.touchUpInside)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: actions
    
    func actionButton(sender button:UIButton)
    {
        controller.openMovements()
    }
}
