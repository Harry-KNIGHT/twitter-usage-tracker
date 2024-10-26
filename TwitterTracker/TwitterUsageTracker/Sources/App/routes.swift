import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.post("api", "twitter-opened") { req -> HTTPStatus in
        let userId = try req.content.decode(TwitterUsageDTO.self)
        
        try await incrementTwitterCounter(for: userId.userId, on: req)
        return .ok
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }

    app.get("api", "twitter-usage") { req -> EventLoopFuture<[TwitterUsage]> in
        return TwitterUsage.query(on: req.db).all()
    }
    
    app.get("api", "twitter-usage", "total-count") { req -> EventLoopFuture<Int> in
        return TwitterUsage.query(on: req.db)
            .all()
            .map { usages in
                usages.reduce(0) { $0 + $1.count }
            }
    }
    
    app.delete("api", "twitter-usage", "clear") { req -> EventLoopFuture<HTTPStatus> in
        return TwitterUsage.query(on: req.db)
            .delete()
            .map { .ok }
    }
}

func incrementTwitterCounter(for userId: String, on req: Request) async throws {
    // Utilise req.db pour interagir avec la base de données
    let today = Date()
    if let usage = try await TwitterUsage.query(on: req.db)
        .filter(\.$userId == userId)
        .filter(\.$date == today)
        .first() {
        // Si oui, incrémente le compteur
        usage.count += 1
        try await usage.save(on: req.db)
    } else {
        // Sinon, crée une nouvelle entrée avec un compteur de 1
        let newUsage = TwitterUsage(userId: userId, date: today, count: 1)
        try await newUsage.save(on: req.db)
    }
}
