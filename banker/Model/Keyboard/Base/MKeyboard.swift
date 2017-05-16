import UIKit

class MKeyboard
{
    var editing:String
    let rows:[[MKeyboardProtocol]]
    let cols:Int
    let kEmpty:String = ""
    let kSign:String = "-"
    let kDot:String = "."
    let currency:String
    private let kInitial:String = "0"
    private let kInfinitum:String = "∞"
    private let numberFormatter:NumberFormatter
    private let kMinIntegers:Int = 1
    private let kMaxIntegers:Int = 9
    private let kMinDecimals:Int = 0
    private let kMaxDecimals:Int = 9
    
    private class func firstRow() -> [MKeyboardProtocol]
    {
        let item7:MKeyboardNumber7 = MKeyboardNumber7()
        let item8:MKeyboardNumber8 = MKeyboardNumber8()
        let item9:MKeyboardNumber9 = MKeyboardNumber9()
        
        let items:[MKeyboardProtocol] = [
            item7,
            item8,
            item9]
        
        return items
    }
    
    private class func secondRow() -> [MKeyboardProtocol]
    {
        return []
    }
    
    init(editing:String?)
    {
        if let currency:String = MSession.sharedInstance.settings?.currency()
        {
            self.currency = currency
        }
        else
        {
            currency = kEmpty
        }
        
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
        
        if let editing:String = editing
        {
            self.editing = editing
        }
        else
        {
            self.editing = "\(currency)\(kInitial)"
        }
        
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
        let stripped:String = editing.replacingOccurrences(of:currency, with:kEmpty)
        
        guard
            
            let number:NSNumber = numberFormatter.number(from:stripped)
            
        else
        {
            return 0
        }
        
        let scalar:Double = number.doubleValue
        
        return scalar
    }
}
