@testable import App
import XCTVapor

final class AppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testRoutes() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)

//        try app.test(.GET, "hello", afterResponse: { res in
//            XCTAssertEqual(res.status, .ok)
//            XCTAssertEqual(res.body.string, "Hello, world!")
//        })
    }
    
    func testGameRoomsController() {
        let gameRoomsController = GameRoomsController()
        let gameMaster = GameMaster(person: Person(name: "Master", id: UUID()), email: "goldena@mail.ru")
        
        // There should be no rooms after init
        XCTAssertEqual(gameRoomsController.rooms.count, 0, "No rooms should have been created")
        
        // Adding single room
        let roomKey = gameRoomsController.createRoom(for: gameMaster)
        XCTAssertEqual(gameRoomsController.rooms.count, 1, "One room should have been created")
        XCTAssertNotNil(gameRoomsController.rooms[0], "No room found at key [0]")

        // Removing single room
        gameRoomsController.removeGameRoom(room: roomKey)
        XCTAssertEqual(gameRoomsController.rooms.count, 0, "No rooms should have been created")
        
        // Adding 10 rooms
        var roomKeys: [Int] = []
        for _ in 1...10 { roomKeys.append(gameRoomsController.createRoom(for: gameMaster)) }
        XCTAssertEqual(gameRoomsController.rooms.count, 10, "10 were not created")
        
        for key in roomKeys {
            XCTAssertNotNil(gameRoomsController.rooms[key], "room at the \(key) is nil")
        }
        
        // Removing the rooms No 3 and 7
        gameRoomsController.removeGameRoom(room: 3)
        gameRoomsController.removeGameRoom(room: 7)

        // Should be 8 rooms with nil(s) at keys 3 and 7
        XCTAssertEqual(gameRoomsController.rooms.count, 8, "Not 8 rooms")
        XCTAssertNil(gameRoomsController.rooms[3], "Room 3 is not nil")
        XCTAssertNil(gameRoomsController.rooms[7], "Room 7 is not nil")
        
        // Adding 1 room back, should be 9
        roomKeys.append(gameRoomsController.createRoom(for: gameMaster))
        XCTAssertEqual(gameRoomsController.rooms.count, 9, "Not 9 rooms")
        
        // Free room at index 3 is occupied again
        XCTAssertNotNil(gameRoomsController.rooms[3], "Room 3 is nil")
        
        // Trying to remove a room twice, to remove at non-existing keys
        gameRoomsController.removeRoom(room: 0)
        gameRoomsController.removeRoom(room: 0)
        gameRoomsController.removeRoom(room: -1)
        gameRoomsController.removeRoom(room: 1_000)

    }
}
