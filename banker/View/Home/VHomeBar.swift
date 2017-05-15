import UIKit

class VHomeBar:UIView
{
    private weak var controller:CHome!
    private weak var labelBalance:UILabel!
    private let kTitleHeight:CGFloat = 22
    private let kBalanceHeight:CGFloat = 40
    private let kBalanceBottom:CGFloat = -10
    private let kLabelMargin:CGFloat = 10
    
    init(controller:CHome)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        self.controller = controller
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.font = UIFont.regular(size:14)
        labelTitle.textColor = UIColor.white
        labelTitle.text = NSLocalizedString("VHomeBar_title", comment:"")
        
        let labelBalance:UILabel = UILabel()
        labelBalance.translatesAutoresizingMaskIntoConstraints = false
        labelBalance.backgroundColor = UIColor.clear
        labelBalance.font = UIFont.numeric(size:35)
        labelBalance.isUserInteractionEnabled = false
        labelBalance.textColor = UIColor.white
        labelBalance.text = "$1,235.00"
        self.labelBalance = labelBalance
        
        addSubview(labelTitle)
        addSubview(labelBalance)
        
        NSLayoutConstraint.bottomToBottom(
            view:labelBalance,
            toView:self,
            constant:kBalanceBottom)
        NSLayoutConstraint.height(
            view:labelBalance,
            constant:kBalanceHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:labelBalance,
            toView:self,
            margin:kLabelMargin)
        
        NSLayoutConstraint.bottomToTop(
            view:labelTitle,
            toView:labelBalance)
        NSLayoutConstraint.height(
            view:labelTitle,
            constant:kTitleHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:labelTitle,
            toView:self,
            margin:kLabelMargin)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
