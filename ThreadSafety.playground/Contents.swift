import Foundation
import PlaygroundSupport

// Thread-unsafe array
do {
    var array = [Int]()
    var iterations = 1000
    let start = Date().timeIntervalSince1970

    DispatchQueue.concurrentPerform(iterations: iterations) { index in
        let last = array.last ?? 0
        array.append(last + 1)

        DispatchQueue.global().sync {
            iterations -= 1

            // Final loop
            guard iterations <= 0 else { return }
            let message = String(format: "Unsafe loop took %.3f seconds, count: %d.",
                                 Date().timeIntervalSince1970 - start,
                                 array.count)
            print(message)
        }
    }
}

// Thread-safe array
do {
    // Background queue to synchronize data access
    let globalBackgroundSyncronizeDataQueue = DispatchQueue.init(label: "globalBackgroundSyncronizeSharedData")

    // Value variable (always accessed from created thread)
    var arrayOfFeedItems_Value : [Int] = []

    // Variable accessor that can be accessed from anywhere (multithread-protected).
    var arrayOfFeedItems : [Int] {

        set(newValue) {
            globalBackgroundSyncronizeDataQueue.sync() {
                arrayOfFeedItems_Value = newValue
            }
        }

        get {
            return globalBackgroundSyncronizeDataQueue.sync {
                arrayOfFeedItems_Value
            }
        }

    }

    var iterations = 1000
    let start = Date().timeIntervalSince1970

    DispatchQueue.concurrentPerform(iterations: iterations) { index in
        let last = arrayOfFeedItems.last ?? 0
        arrayOfFeedItems.append(last + 1)

        DispatchQueue.global().sync {
            iterations -= 1

            // Final loop
            guard iterations <= 0 else { return }
            let message = String(format: "Safe loop took %.3f seconds, count: %d.",
                                 Date().timeIntervalSince1970 - start,
                                 arrayOfFeedItems.count)
            print(message)
        }
    }
}

PlaygroundPage.current.needsIndefiniteExecution = true
