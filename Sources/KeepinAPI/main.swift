// Find a way to add a flag during the compilation.
// For example: swift build -c debug -Xswiftc -DQA
import Vapor

#if QA
print("hello, world");
#endif

let drop = try Droplet()

// will load 0.0.0.0 or 127.0.0.1 based on above config
let host = drop.config["server", "host"]?.string ?? "0.0.0.0"
// will load 9000, or environment variable port.
let port = drop.config["server", "port"]?.int ?? 8080

drop.get("hello") { req in
    return "Hello Vapor"
}

try drop.run()
