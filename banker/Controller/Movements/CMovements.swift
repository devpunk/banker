import UIKit

class CMovements:CController
{
    var isDeposit:Bool
    private weak var viewMovements:VMovements!
    
    override init()
    {
        isDeposit = true
        super.init()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func loadView()
    {
        let viewMovements:VMovements = VMovements(controller:self)
        self.viewMovements = viewMovements
        view = viewMovements
    }
    
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        parentController.statusBarAppareance(statusBarStyle:UIStatusBarStyle.default)
        let _:Bool = viewMovements.viewField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated:Bool)
    {
        super.viewWillDisappear(animated)
        parentController.statusBarAppareance(statusBarStyle:UIStatusBarStyle.lightContent)
    }
    
    override func viewWillTransition(to size:CGSize, with coordinator:UIViewControllerTransitionCoordinator)
    {
        if parentController.childViewControllers.last === self
        {
            UIApplication.shared.keyWindow!.endEditing(true)
            
            coordinator.animate(alongsideTransition:
            { (context:UIViewControllerTransitionCoordinatorContext) in
                    
            })
            { [weak self] (context:UIViewControllerTransitionCoordinatorContext) in
                
                let _:Bool? = self?.viewMovements.viewField.becomeFirstResponder()
            }
        }
    }
    
    //MARK: private
    
    private func asyncNext()
    {
        guard
            
            let keyboard:VKeyboard = viewMovements.viewField.inputView as? VKeyboard
            
        else
        {
            return
        }
        
        let value:Double = keyboard.model.currentValue()
        
        if value > 0
        {
            
        }
        else
        {
            let message:String = NSLocalizedString("CMovements_errorEmpty", comment:"")
            VAlert.messageRed(message:message)
            
            DispatchQueue.main.async
            { [weak self] in
                
                 let _:Bool? = self?.viewMovements.viewField.becomeFirstResponder()
            }
        }
    }
    
    //MARK: public
    
    func back()
    {
        UIApplication.shared.keyWindow!.endEditing(true)
        parentController.pop(horizontal:CParent.TransitionHorizontal.fromRight)
    }
    
    func next()
    {
        UIApplication.shared.keyWindow!.endEditing(true)
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncNext()
        }
    }
}
