import UIKit

extension UIFont
{
    class func regular(size:CGFloat) -> UIFont
    {
        return UIFont(name:"ArialMT", size:size)!
    }
    
    class func bold(size:CGFloat) -> UIFont
    {
        return UIFont(name:"Arial-BoldMT", size:size)!
    }
}
