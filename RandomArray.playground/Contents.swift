import Foundation

let sizeOfArray = 100

// MARK: - simpleUniqueRandomArray
func simpleUniqueRandomArray(size: Int) -> [Int] {
    var randomArray: Array<Int> = []

    while randomArray.count < size {
        let randomNumber = Int.random(in: 0..<size)
        if randomArray.contains(randomNumber) {
            continue
        }
        randomArray.append(randomNumber)
    }
    return randomArray
}

var start = CFAbsoluteTimeGetCurrent()
print("simpleUniqueRandomArray elements:\n\(simpleUniqueRandomArray(size: sizeOfArray))\n")
var diff = CFAbsoluteTimeGetCurrent() - start
print("simpleUniqueRandomArray took \(diff) seconds\n")

// MARK: - setUniqueRandomArray
func setUniqueRandomArray(size: Int) -> [Int] {
    var randomArray = Array<Int>()
    var set = Set<Int>()

    while randomArray.count < size {
        let randomNumber = Int.random(in: 0..<size)

        if set.contains(randomNumber) {
            continue
        }
        set.insert(randomNumber)
        randomArray.append(randomNumber)
    }
    return randomArray
}

start = CFAbsoluteTimeGetCurrent()
print("setUniqueRandomArray elements:\n\(setUniqueRandomArray(size: sizeOfArray))\n")
diff = CFAbsoluteTimeGetCurrent() - start
print("setUniqueRandomArray took \(diff) seconds\n")

// MARK: - shuffleUniqueRandomNumberArray
func shuffleUniqueRandomNumberArray(size: Int) -> [Int] {
    return Array(0..<size).shuffled()
}

start = CFAbsoluteTimeGetCurrent()
print("shuffleUniqueRandomNumberArray elements:\n\(shuffleUniqueRandomNumberArray(size: sizeOfArray)))\n")
diff = CFAbsoluteTimeGetCurrent() - start
print("shuffleUniqueRandomNumberArray took \(diff) seconds\n")
