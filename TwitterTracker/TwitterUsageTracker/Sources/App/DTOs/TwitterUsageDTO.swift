import Fluent
import Vapor

struct TwitterUsageDTO: Content {
    var userId: String
    var date: Date = Date()
}
