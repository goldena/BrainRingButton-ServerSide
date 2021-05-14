import Vapor

func routes(_ app: Application) throws {
    app.get(":lobby", ":name", ":id", ":pass") { req -> String in
        guard let lobby = Int(req.parameters.get("lobby") ?? "Invalid lobby number"),
              let name = req.parameters.get("name"),
              let id = UUID.init(req.parameters.get("id") ?? "Invalid UUID"),
              let pass = req.parameters.get("pass") else {
            return "Invalid input"
        }
        
        guard pass == "password" else {
            return "Invalid password"
        }
        
        let token = UUID()
        
        return "Player: \(name) with UUID: \(id) has joined the lobby: \(lobby) with the token: \(token)"
    }
    
    app.webSocket("socket") { req, ws in
        
//        var pong = 0
//        ws.onPong { ws in
//            pong += 1
//            print("Pong \(pong)")
//        }
//
//        ws.pingInterval = .seconds(1)
//        ws.sendPing()
        
        ws.onText { ws, text in
            if text.hasPrefix("join room with: ") && text.contains("token") {
                ws.send("Joined the room")
            } else {
                ws.send("Received: \(text)")
            }
        }
        
        ws.onClose.whenComplete { result in
            print(result)
        }
    }
}
