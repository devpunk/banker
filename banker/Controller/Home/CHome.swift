import UIKit

class CHome:CController
{
    private weak var viewHome:VHome!
    let modelHome:MHome
    
    override init()
    {
        modelHome = MHome()
        super.init()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func loadView()
    {
        let viewHome:VHome = VHome(controller:self)
        self.viewHome = viewHome
        view = viewHome
    }
    
    //MARK: public
    
    func openMovements()
    {
        let controllerMovements:CMovements = CMovements()
        parentController.push(
            controller:controllerMovements,
            horizontal:CParent.TransitionHorizontal.fromRight)
    }
}
