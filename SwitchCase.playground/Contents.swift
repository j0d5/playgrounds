import UIKit

let someCharacter: Character = "z"

switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}

enum AllowedCharacters: Int {
    case a
    case b
    case c
}

let character: AllowedCharacters = .a
switch character {
case .a:
    print("The first letter of the alphabet")
case .b:
    print("The second letter of the alphabet")
case .c:
    print("The third letter of the alphabet")
}
