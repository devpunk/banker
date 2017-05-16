import UIKit

class CMovements:CController
{
    private weak var viewMovements:VMovements!
    
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
        viewMovements.viewAppeared()
    }
    
    override func viewWillDisappear(_ animated:Bool)
    {
        super.viewWillDisappear(animated)
        parentController.statusBarAppareance(statusBarStyle:UIStatusBarStyle.lightContent)
    }
}
