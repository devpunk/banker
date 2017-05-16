import UIKit

class MKeyboardNumber3:MKeyboardNumber
{
    private let kNumber:String = "3"
    
    init()
    {
        super.init(number:kNumber, image:#imageLiteral(resourceName: "assetKeyboard3"))
    }
}
