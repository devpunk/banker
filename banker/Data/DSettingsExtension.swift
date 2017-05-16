import Foundation

extension DSettings
{
    private static let kDefaultCurrency:String = "$"
    
    //MARK: public
    
    func addTtl()
    {
        ttl += 1
        DManager.sharedInstance?.save()
    }
    
    func currency() -> String
    {
        guard
        
            let currencySymbol:String = self.currencySymbol
        
        else
        {
            return DSettings.kDefaultCurrency
        }
        
        return currencySymbol
    }
}
