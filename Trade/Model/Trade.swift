
import Foundation

class Trade {
    var valueBuy: String
    var priceBuy: String
    var valueSell: String
    var priceSell: String
    
    init(valueBuy: String, priceBuy: String, valueSell: String, priceSell: String) {
        self.valueBuy = valueBuy
        self.priceBuy = priceBuy
        
        self.valueSell = valueSell
        self.priceSell = priceSell
    }
}

