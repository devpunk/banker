import UIKit

class VMovementsMenuType:UIView
{
    private weak var controller:CMovements!
    private weak var itemDeposit:VMovementsMenuTypeItem!
    private weak var itemExpense:VMovementsMenuTypeItem!
    private weak var viewIndicator:VMovementsMenuTypeIndicator!
    private weak var layoutIndicatorLeft:NSLayoutConstraint!
    private let kItemMultiplier:CGFloat = 0.5
    private let kIndicatorMultiplier:CGFloat = 0.55
    
    init(controller:CMovements)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let itemDeposit:VMovementsMenuTypeItem = VMovementsMenuTypeItem(
            title:NSLocalizedString("VMovementsMenuType_itemDeposit", comment:""))
        self.itemDeposit = itemDeposit
        
        let itemExpense:VMovementsMenuTypeItem = VMovementsMenuTypeItem(
            title:NSLocalizedString("VMovementsMenuType_itemExpense", comment:""))
        self.itemExpense = itemExpense
        
        let viewIndicator:VMovementsMenuTypeIndicator = VMovementsMenuTypeIndicator()
        self.viewIndicator = viewIndicator
        
        addSubview(viewIndicator)
        addSubview(itemExpense)
        addSubview(itemDeposit)
        
        NSLayoutConstraint.equalsVertical(
            view:viewIndicator,
            toView:self)
        layoutIndicatorLeft = NSLayoutConstraint.leftToLeft(
            view:viewIndicator,
            toView:self)
        NSLayoutConstraint.width(
            view:viewIndicator,
            toView:self,
            multiplier:kIndicatorMultiplier)
        
        NSLayoutConstraint.equalsVertical(
            view:itemExpense,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:itemExpense,
            toView:self)
        NSLayoutConstraint.width(
            view:itemExpense,
            toView:self,
            multiplier:kItemMultiplier)
        
        NSLayoutConstraint.equalsVertical(
            view:itemDeposit,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:itemDeposit,
            toView:self)
        NSLayoutConstraint.width(
            view:itemDeposit,
            toView:self,
            multiplier:kItemMultiplier)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
