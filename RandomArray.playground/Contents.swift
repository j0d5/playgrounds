import Foundation

let sizeOfArray = 100

func measure(name: String, function: (Int) -> [Int]) {
    let start = CFAbsoluteTimeGetCurrent()
    function(sizeOfArray)
    print("\(name) took \(CFAbsoluteTimeGetCurrent() - start) seconds\n")
}

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

measure(name: "simpleUniqueRandomArray", function: simpleUniqueRandomArray)

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

measure(name: "setUniqueRandomArray", function: setUniqueRandomArray)

// MARK: - shuffleUniqueRandomNumberArray
func shuffleUniqueRandomNumberArray(size: Int) -> [Int] {
    var randomArray = Array<Int>(0..<size)
    for i in 0..<size {
        let j = Int.random(in: 0..<size)
        let tempI = randomArray[i]
        randomArray[i] = randomArray[j]
        randomArray[j] = tempI
    }
    return randomArray
}

measure(name: "shuffleUniqueRandomNumberArray", function: shuffleUniqueRandomNumberArray)

// MARK: - swiftShuffleUniqueRandomNumberArray
func swiftShuffleUniqueRandomNumberArray(size: Int) -> [Int] {
    return Array(0..<size).shuffled()
}

measure(name: "swiftShuffleUniqueRandomNumberArray", function: swiftShuffleUniqueRandomNumberArray)
