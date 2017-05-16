import Foundation

class MHome
{
    let items:[MHomeProtocol]
    
    init()
    {
        let itemChart:MHomeChart = MHomeChart()
        let itemCalendar:MHomeCalendar = MHomeCalendar()
        let itemBudgets:MHomeBudgets = MHomeBudgets()
        let itemSettings:MHomeSettings = MHomeSettings()
        let itemStore:MHomeStore = MHomeStore()
        
        items = [
            itemChart,
            itemCalendar,
            itemBudgets,
            itemSettings,
            itemStore]
    }
}
