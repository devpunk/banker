import UIKit

class MKeyboardNumber8:MKeyboardNumber
{
    private let kNumber:String = "8"
    
    init()
    {
        super.init(number:kNumber, image:#imageLiteral(resourceName: "assetKeyboard8"))
    }
}
