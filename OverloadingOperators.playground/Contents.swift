//: Playground - noun: a place where people can play
import UIKit

// Resources struct for which we create the overloaded operator
struct Resources {
    private (set) var gold: Int
    private (set) var silver: Int
    private (set) var wood: Int
}

// Extension for struct Resources with the overloaded operator
extension Resources {
    static func -=(lhs: inout Resources, rhs: Resources) {
        lhs.gold -= rhs.gold
        lhs.silver -= rhs.silver
        lhs.wood -= rhs.wood
    }
}

var res = Resources(gold: 10, silver: 15, wood: 20)
let knightCosts = Resources(gold: 2, silver: 3, wood: 1)

print("Creating new variable for resources \(res)")
print("Substracting the knights cost \(knightCosts) from \(res)")
res -= knightCosts
print("Result of \(res)")




var label = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
var imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))

label.frame.origin = CGPoint(
    x: imageView.bounds.width + 10,
    y: imageView.bounds.height + 20
)

extension CGSize {
    static func +(lhs: CGSize, rhs: CGSize) -> CGPoint {
        return CGPoint(
            x: lhs.width + rhs.width,
            y: lhs.height + rhs.height
        )
    }
}

label.frame.origin = imageView.bounds.size + CGSize(width: 10, height: 20)

print(label.frame)

infix operator ~>

func ~><T>(expression: @autoclosure () throws -> T,
           errorTransform: (Error) -> Error) throws -> T {
    do {
        return try expression()
    } catch {
        throw errorTransform(error)
    }
}

