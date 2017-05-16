import UIKit

class MKeyboardNumber5:MKeyboardNumber
{
    private let kNumber:String = "5"
    
    init()
    {
        super.init(number:kNumber, image:#imageLiteral(resourceName: "assetKeyboard5"))
    }
}
