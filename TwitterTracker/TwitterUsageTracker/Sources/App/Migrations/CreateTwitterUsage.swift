import Fluent

struct CreateTwitterUsage: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("twitter_usage")
            .id()
            .field("user_id", .string, .required)
            .field("date", .date, .required)
            .field("count", .int, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("twitter_usage").delete()
    }
}
