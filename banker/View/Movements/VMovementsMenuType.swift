import UIKit

class VMovementsMenuType:UIView
{
    private weak var controller:CMovements!
    private weak var itemDeposit:VMovementsMenuTypeItem!
    private weak var itemExpense:VMovementsMenuTypeItem!
    private weak var layoutExpenseWidth:NSLayoutConstraint!
    
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
        
        addSubview(itemExpense)
        addSubview(itemDeposit)
        
        NSLayoutConstraint.equalsVertical(
            view:itemExpense,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:itemExpense,
            toView:self)
        layoutExpenseWidth = NSLayoutConstraint.width(
            view:itemExpense)
        
        NSLayoutConstraint.equalsVertical(
            view:itemDeposit,
            toView:self)
        NSLayoutConstraint.leftToRight(
            view:itemDeposit,
            toView:itemExpense)
        NSLayoutConstraint.rightToRight(
            view:itemDeposit,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.size.width
        let width_2:CGFloat = width / 2.0
        layoutExpenseWidth.constant = width_2
        
        super.layoutSubviews()
    }
}
