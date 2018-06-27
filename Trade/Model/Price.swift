
import Foundation

class Price {
    var title : String
    var value: String
    var trend: String
    var trend_sign: String
   
    init(title: String, value: String, trend: String, trend_sign: String) {
        self.title = title
        self.value = value
        self.trend = trend
        self.trend_sign = trend_sign
    }
}
