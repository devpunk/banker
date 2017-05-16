import UIKit

class MKeyboardNumber2:MKeyboardNumber
{
    private let kNumber:String = "2"
    
    init()
    {
        super.init(number:kNumber, image:#imageLiteral(resourceName: "assetKeyboard2"))
    }
}
