import UIKit

class MKeyboardNumber9:MKeyboardNumber
{
    private let kNumber:String = "9"
    
    init()
    {
        super.init(number:kNumber, image:#imageLiteral(resourceName: "assetKeyboard9"))
    }
}
