import UIKit

class MKeyboardNumber1:MKeyboardNumber
{
    private let kNumber:String = "1"
    
    init()
    {
        super.init(number:kNumber, image:#imageLiteral(resourceName: "assetKeyboard1"))
    }
}
