import UIKit

class VMovementsMenuType:UIView
{
    private weak var controller:CMovements!
    private weak var itemDeposit:VMovementsMenuTypeItem!
    private weak var itemExpense:VMovementsMenuTypeItem!
    private weak var viewIndicator:VMovementsMenuTypeIndicator!
    private weak var layoutIndicatorLeft:NSLayoutConstraint!
    private let kItemMultiplier:CGFloat = 0.5
    private let kIndicatorMultiplier:CGFloat = 0.5
    private let kBackgroundMargin:CGFloat = 1
    private let kAnimationDuration:TimeInterval = 0.4
    
    init(controller:CMovements)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let viewBackground:VMovementsMenuTypeBackground = VMovementsMenuTypeBackground()
        
        let itemDeposit:VMovementsMenuTypeItem = VMovementsMenuTypeItem(
            title:NSLocalizedString("VMovementsMenuType_itemDeposit", comment:""))
        itemDeposit.addTarget(
            self,
            action:#selector(actionDeposit(sender:)),
            for:UIControlEvents.touchUpInside)
        self.itemDeposit = itemDeposit
        
        let itemExpense:VMovementsMenuTypeItem = VMovementsMenuTypeItem(
            title:NSLocalizedString("VMovementsMenuType_itemExpense", comment:""))
        itemExpense.addTarget(
            self,
            action:#selector(actionExpense(sender:)),
            for:UIControlEvents.touchUpInside)
        self.itemExpense = itemExpense
        
        let viewIndicator:VMovementsMenuTypeIndicator = VMovementsMenuTypeIndicator()
        self.viewIndicator = viewIndicator
        
        let panGesture:UIPanGestureRecognizer = UIPanGestureRecognizer(
            target:self,
            action:#selector(actionPanning(sender:)))
        
        addSubview(viewBackground)
        addSubview(viewIndicator)
        addSubview(itemExpense)
        addSubview(itemDeposit)
        addGestureRecognizer(panGesture)
        
        NSLayoutConstraint.equals(
            view:viewBackground,
            toView:self,
            margin:kBackgroundMargin)
        
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
    
    override func layoutSubviews()
    {
        let deposit:Bool = controller.isDeposit
        
        DispatchQueue.main.async
        { [weak self] in
            
            if deposit
            {
                self?.indicatorDeposit(animated:false)
            }
            else
            {
                self?.indicatorExpense(animated:false)
            }
        }
        
        super.layoutSubviews()
    }
    
    //MARK: actions
    
    func actionExpense(sender button:UIButton)
    {
        controller.isDeposit = false
        indicatorExpense(animated:true)
    }
    
    func actionDeposit(sender button:UIButton)
    {
        controller.isDeposit = true
        indicatorDeposit(animated:true)
    }
    
    func actionPanning(sender panGesture:UIPanGestureRecognizer)
    {
        
    }
    
    //MARK: private
    
    private func buttonDeposit()
    {
        itemDeposit.isSelected = true
        itemExpense.isSelected = false
    }
    
    private func buttonExpense()
    {
        itemDeposit.isSelected = false
        itemExpense.isSelected = true
    }
    
    private func indicatorExpense(animated:Bool)
    {
        buttonExpense()
        
        let duration:TimeInterval
        
        if animated
        {
            duration = kAnimationDuration
        }
        else
        {
            duration = 0
        }
        
        layoutIndicatorLeft.constant = 0
        
        UIView.animate(withDuration:duration)
        { [weak self] in
            
            self?.layoutIfNeeded()
        }
    }
    
    private func indicatorDeposit(animated:Bool)
    {
        buttonDeposit()
        
        let duration:TimeInterval
        
        if animated
        {
            duration = kAnimationDuration
        }
        else
        {
            duration = 0
        }
        
        layoutIndicatorLeft.constant = bounds.midX
        
        UIView.animate(withDuration:duration)
        { [weak self] in
            
            self?.layoutIfNeeded()
        }
    }
}
