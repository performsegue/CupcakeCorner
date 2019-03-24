import Vapor
import Leaf
import Fluent
import FluentSQLite

/// Called before your application initializes.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#configureswift)
public func configure(
    _ config: inout Config,
    _ env: inout Environment,
    _ services: inout Services
) throws {
    // Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    // Configure the rest of your application here
    try services.register(LeafProvider())
    config.prefer(LeafRenderer.self, for: ViewRenderer.self)
    
    let directoryConfig = DirectoryConfig.detect()
    services.register(directoryConfig)
    
    try services.register(FluentSQLiteProvider())
    
    var dataBaseConfig = DatabasesConfig()
    let db = try SQLiteDatabase(storage: .file(path: "\(directoryConfig.workDir)cupcakes.db"))
    dataBaseConfig.add(database: db, as: .sqlite)
    services.register(dataBaseConfig)
    
    var migrationConfig = MigrationConfig()
    migrationConfig.add(model: Cupcake.self, database: .sqlite)
    migrationConfig.add(model: Order.self, database: .sqlite)
    services.register(migrationConfig)
    
    
}
 
