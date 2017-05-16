import UIKit

protocol MKeyboardProtocol
{
    var icon:UIImage { get }
    func selected(model:MKeyboard, view:UITextView)
}
