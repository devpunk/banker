import UIKit

class MKeyboardNumber:MKeyboardProtocol
{
    private let number:String
    private let image:UIImage
    
    init(number:String, image:UIImage)
    {
        self.number = number
        self.image = image
    }
    
    //MARK: keyboard protocol
    
    var icon:UIImage
    {
        get
        {
            return image
        }
    }
    
    final func selected(model:MKeyboard, view:UITextView)
    {
        let currentString:String = view.text
        let countCharacters:Int = currentString.characters.count
        
        if countCharacters < 3
        {
            let currentNumber:Double = model.currentValue()
            
            if currentNumber == 0
            {
                if !currentString.contains(model.kDot)
                {
                    view.text = model.currency
                }
            }
        }
        
        view.insertText(number)
        model.editing = view.text
    }
}
