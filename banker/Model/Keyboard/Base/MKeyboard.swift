import UIKit

class MKeyboard
{
    let rows:[[MKeyboardProtocol]]
    let cols:Int
    let kEmpty:String = ""
    let kSign:String = "-"
    let kInitial:String = "0"
    let kDot:String = "."
    let kInfinitum:String = "∞"
    private let numberFormatter:NumberFormatter
    private let kMinIntegers:Int = 1
    private let kMaxIntegers:Int = 9
    private let kMinDecimals:Int = 0
    private let kMaxDecimals:Int = 9
    
    private class func firstRow() -> [MKeyboardProtocol]
    {
        return []
    }
    
    private class func secondRow() -> [MKeyboardProtocol]
    {
        return []
    }
    
    init()
    {
        var cols:Int = 0
        var rows:[[MKeyboardProtocol]] = []
        
        let firstRow:[MKeyboardProtocol] = MKeyboard.firstRow()
        rows.append(firstRow)
        
        if firstRow.count > cols
        {
            cols = firstRow.count
        }
        
        let secondRow:[MKeyboardProtocol] = MKeyboard.secondRow()
        rows.append(secondRow)
        
        if secondRow.count > cols
        {
            cols = secondRow.count
        }
        
        self.rows = rows
        self.cols = cols
        
        numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.minimumIntegerDigits = kMinIntegers
        numberFormatter.maximumIntegerDigits = kMaxIntegers
        numberFormatter.minimumFractionDigits = kMinDecimals
        numberFormatter.maximumFractionDigits = kMaxDecimals
    }
    
    //MARK: public
    
    func lastNumber() -> Double
    {
        guard
            
            let string:String = states.last?.editing,
            let number:NSNumber = numberFormatter.number(
                from:string)
            
            else
        {
            return 0
        }
        
        let scalar:Double = number.doubleValue
        
        return scalar
    }
    
    func numberAsString(scalar:Double) -> String
    {
        let number:NSNumber = NSNumber(value:scalar)
        
        guard
            
            let string:String = numberFormatter.string(from:number)
            
            else
        {
            return kInitial
        }
        
        return string
    }
    
    func stringAsNumber(string:String) -> Double
    {
        guard
            
            let number:NSNumber = numberFormatter.number(
                from:string)
            
            else
        {
            return 0
        }
        
        let scalar:Double = number.doubleValue
        
        return scalar
    }
    
    func updateIfNeeded(view:UITextView)
    {
        guard
            
            let lastState:MKeyboardState = states.last
            
            else
        {
            return
        }
        
        if lastState.needsUpdate
        {
            lastState.needsUpdate = false
            view.text = lastState.editing
        }
    }
    
    func commitIfNeeded(view:UITextView)
    {
        guard
            
            let lastState:MKeyboardState = states.last
            
            else
        {
            return
        }
        
        if lastState.needsUpdate
        {
            states.removeLast()
        }
        else
        {
            lastState.commitState(
                model:self,
                view:view)
            
            NotificationCenter.default.post(
                name:Notification.keyboardUpdate,
                object:lastState)
        }
    }
}
