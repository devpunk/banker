import UIKit

class MKeyboardBackspace:MKeyboardProtocol
{
    //MARK: keyboard protocol
    
    var icon:UIImage
    {
        get
        {
            return #imageLiteral(resourceName: "assetKeyboardBackspace")
        }
    }
    
    func selected(model:MKeyboard, view:UITextView)
    {
        let current:String = view.text
        let countCurrent:Int = current.characters.count
        
        if countCurrent < 3
        {
            if current.contains(model.currency) || countCurrent == 1
            {
                view.text = model.currency
                view.insertText(model.kInitial)
            }
            else
            {
                view.deleteBackward()
            }
        }
        else
        {
            view.deleteBackward()
        }
        
        model.editing = view.text
    }
}
