import NIOSSL
import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    let hostname = Environment.get("DATABASE_HOST") ?? "localhost"
    let port = Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? 5432
    let username = Environment.get("DATABASE_USERNAME") ?? "vapor_user"
    let password = Environment.get("DATABASE_PASSWORD") ?? "vapor_password"
    let database = Environment.get("DATABASE_NAME") ?? "vapor_database"

    app.databases.use(.postgres(
        hostname: hostname,
        port: port,
        username: username,
        password: password,
        database: database
    ), as: .psql)

    app.migrations.add(CreateTwitterUsage())
    try await app.autoMigrate().get()
    // register routes
    try routes(app)
}
