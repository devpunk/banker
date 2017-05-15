import Foundation

class MHome
{
    let items:[MHomeProtocol]
    
    init()
    {
        let itemMovement:MHomeMovement = MHomeMovement()
        
        items = [
            itemMovement]
    }
}
