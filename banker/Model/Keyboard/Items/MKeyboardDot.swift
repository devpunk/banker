import UIKit

class MKeyboardDot:MKeyboardProtocol
{
    //MARK: keyboard protocol
    
    var icon:UIImage
    {
        get
        {
            return #imageLiteral(resourceName: "assetKeyboardDot")
        }
    }
    
    func selected(model:MKeyboard, view:UITextView)
    {
        let current:String = view.text
        
        if !current.contains(model.kDot)
        {
            view.insertText(model.kDot)
            model.editing = view.text
        }
    }
}
