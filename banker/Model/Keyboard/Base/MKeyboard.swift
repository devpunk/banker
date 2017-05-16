import UIKit

class MKeyboard
{
    var editing:String
    let currency:String
    let rows:[[MKeyboardProtocol]]
    let cols:Int
    let kEmpty:String = ""
    let kDot:String = "."
    let kInitial:String = "0"
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
        let item4:MKeyboardNumber4 = MKeyboardNumber4()
        let item5:MKeyboardNumber5 = MKeyboardNumber5()
        let item6:MKeyboardNumber6 = MKeyboardNumber6()
        
        let items:[MKeyboardProtocol] = [
            item4,
            item5,
            item6]
        
        return items
    }
    
    private class func thirdRow() -> [MKeyboardProtocol]
    {
        let item1:MKeyboardNumber1 = MKeyboardNumber1()
        let item2:MKeyboardNumber2 = MKeyboardNumber2()
        let item3:MKeyboardNumber3 = MKeyboardNumber3()
        
        let items:[MKeyboardProtocol] = [
            item1,
            item2,
            item3]
        
        return items
    }
    
    private class func fourthRow() -> [MKeyboardProtocol]
    {
        let item0:MKeyboardNumber0 = MKeyboardNumber0()
        let itemBackspace:MKeyboardBackspace = MKeyboardBackspace()
        
        let items:[MKeyboardProtocol] = [
            item0,
            itemBackspace]
        
        return items
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
        
        rows = [
            MKeyboard.firstRow(),
            MKeyboard.secondRow(),
            MKeyboard.thirdRow(),
            MKeyboard.fourthRow()]
        
        for row:[MKeyboardProtocol] in rows
        {
            let countItems:Int = row.count
            
            if countItems > cols
            {
                cols = countItems
            }
        }
        
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
