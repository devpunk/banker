import UIKit

class VMovementsMenuTypeItem:UIButton
{
    init(title:String)
    {
        super.init(frame:CGRect.zero)
        setTitle(title, for:UIControlState.normal)
        setTitleColor(
            UIColor.white,
            for:UIControlState.highlighted)
        setTitleColor(
            UIColor.white,
            for:UIControlState.selected)
        setTitleColor(
            UIColor.bankerOrange,
            for:UIControlState.normal)
        titleLabel!.font = UIFont.regular(size:13)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
