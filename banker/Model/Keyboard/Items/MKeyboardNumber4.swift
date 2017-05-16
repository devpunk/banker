import UIKit

class MKeyboardNumber4:MKeyboardNumber
{
    private let kNumber:String = "4"
    
    init()
    {
        super.init(number:kNumber, image:#imageLiteral(resourceName: "assetKeyboard4"))
    }
}
