import NIOSSL
import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    guard let hostname = Environment.get("DATABASE_HOST"),
          let portString = Environment.get("DATABASE_PORT"),
          let port = Int(portString),
          let username = Environment.get("DATABASE_USERNAME"),
          let password = Environment.get("DATABASE_PASSWORD"),
          let database = Environment.get("DATABASE_NAME") else {
        fatalError("Database environment variables not set")
    }
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
