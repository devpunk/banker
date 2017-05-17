import UIKit

class VMovementsMenuTypeItem:UIButton
{
    init(title:String)
    {
        super.init(frame:CGRect.zero)
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        setTitle(title, for:UIControlState.normal)
        setTitleColor(
            UIColor.bankerOrange,
            for:UIControlState.highlighted)
        setTitleColor(
            UIColor.white,
            for:UIControlState.selected)
        setTitleColor(
            UIColor.bankerBlue,
            for:UIControlState.normal)
        titleLabel!.font = UIFont.bold(size:14)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
