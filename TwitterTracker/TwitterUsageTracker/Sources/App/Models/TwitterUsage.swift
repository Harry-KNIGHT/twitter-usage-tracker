import Fluent
import Foundation
import struct Foundation.UUID

/// Property wrappers interact poorly with `Sendable` checking, causing a warning for the `@ID` property
/// It is recommended you write your model with sendability checking on and then suppress the warning
/// afterwards with `@unchecked Sendable`.
final class TwitterUsage: Model, @unchecked Sendable {
    static let schema = "twitter_usage"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "user_id")
    var userId: String
    
    @Field(key: "date")
    var date: Date
    
    @Field(key: "count")
    var count: Int



    init() { }

    init(id: UUID? = nil, userId: String, date: Date, count: Int) {
        self.id = id
        self.userId = userId
        self.date = date
        self.count = count
    }
}
