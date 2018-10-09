
import UIKit

var str = "Hello, playground"

@available(iOS, message: "It's available on iOS", introduced: 1.0, renamed: "newName")
func example() {}

@available(iOS 10.0, macOS 10.12, *)
class MyClass {
    // class definition
}

@discardableResult
func example() -> String { return "HelloWorld" }

@inlinable
func inlineFunc() {}

class exampleClass {
    @nonobjc
    func nonObjCfunc() {}
}

