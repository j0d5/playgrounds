import Foundation

var str = "Hello, playground"

var dict = Dictionary<String, String>()
let test = dict["huhu"]

if (nil == NSNull()) {
    print("Is equal")
}
print(test ?? "")
