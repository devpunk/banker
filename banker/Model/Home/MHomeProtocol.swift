import UIKit

protocol MHomeProtocol
{
    var image:UIImage { get }
    var title:String { get }
    
    func selected(controller:CHome)
}
