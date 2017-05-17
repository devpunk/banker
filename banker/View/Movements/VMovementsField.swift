import UIKit

class VMovementsField:UITextView, UITextViewDelegate
{
    private weak var controller:CMovements!
    private let insetsHorizontal3:CGFloat
    private let kFontSize:CGFloat = 45
    private let kInsetsHorizontal:CGFloat = 5
    
    init(controller:CMovements)
    {
        insetsHorizontal3 = kInsetsHorizontal + kInsetsHorizontal + kInsetsHorizontal
        
        super.init(frame:CGRect.zero, textContainer:nil)
        delegate = self
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
        textColor = UIColor.black
        tintColor = UIColor.clear
        bounces = false
        isScrollEnabled = false
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        returnKeyType = UIReturnKeyType.default
        keyboardAppearance = UIKeyboardAppearance.light
        autocorrectionType = UITextAutocorrectionType.no
        spellCheckingType = UITextSpellCheckingType.no
        autocapitalizationType = UITextAutocapitalizationType.none
        keyboardType = UIKeyboardType.numbersAndPunctuation
        contentInset = UIEdgeInsets.zero
        textAlignment = NSTextAlignment.right
        font = UIFont.numeric(size:kFontSize)
        textContainerInset = UIEdgeInsets(
            top:0,
            left:kInsetsHorizontal,
            bottom:0,
            right:kInsetsHorizontal)
        self.controller = controller
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func becomeFirstResponder() -> Bool
    {
        let modelKeyboard:MKeyboard?
        
        if let inputView:VKeyboard = self.inputView as? VKeyboard
        {
            modelKeyboard = inputView.model
        }
        else
        {
            modelKeyboard = nil
        }
        
        let fieldInput:VKeyboard = VKeyboard(textView:self, model:modelKeyboard)
        inputView = fieldInput
        
        return super.becomeFirstResponder()
    }
}
