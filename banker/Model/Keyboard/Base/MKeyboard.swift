import UIKit

class MKeyboard
{
    let rows:[[MKeyboardProtocol]]
    let cols:Int
    private var editing:String
    private let kSign:String = "-"
    private let kInitial:String = "0"
    private let kDot:String = "."
    private let kInfinitum:String = "∞"
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
        editing = kInitial
        
        numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.minimumIntegerDigits = kMinIntegers
        numberFormatter.maximumIntegerDigits = kMaxIntegers
        numberFormatter.minimumFractionDigits = kMinDecimals
        numberFormatter.maximumFractionDigits = kMaxDecimals
    }
    
    //MARK: public
    
    func currentValue() -> Double
    {
        guard
            let number:NSNumber = numberFormatter.number(from:editing)
            
        else
        {
            return 0
        }
        
        let scalar:Double = number.doubleValue
        
        return scalar
    }
}
