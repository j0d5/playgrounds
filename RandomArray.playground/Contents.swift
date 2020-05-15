import Foundation

let sizeOfArray = 100

func measure(function: (Int) -> [Int]) -> CFAbsoluteTime {
    let start = CFAbsoluteTimeGetCurrent()
    function(sizeOfArray)
    return CFAbsoluteTimeGetCurrent() - start
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

print("simpleUniqueRandomArray took \(measure(function: simpleUniqueRandomArray)) seconds\n")

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

print("setUniqueRandomArray took \(measure(function: setUniqueRandomArray)) seconds\n")

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

print("shuffleUniqueRandomNumberArray took \(measure(function: shuffleUniqueRandomNumberArray)) seconds\n")

// MARK: - swiftShuffleUniqueRandomNumberArray
func swiftShuffleUniqueRandomNumberArray(size: Int) -> [Int] {
    return Array(0..<size).shuffled()
}

print("swiftShuffleUniqueRandomNumberArray took \(measure(function: swiftShuffleUniqueRandomNumberArray)) seconds\n")
