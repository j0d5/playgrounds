import Foundation

let list = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26 ]

func measure(function: ([Int]) -> [Int]) -> CFAbsoluteTime {
    let start = CFAbsoluteTimeGetCurrent()
    function(list)
    return CFAbsoluteTimeGetCurrent() - start
}

// MARK: - QuickSort
func quickSort<T: Comparable>(_ a: [T]) -> [T] {
  guard a.count > 1 else { return a }

  let pivot = a[a.count/2]
  let less = a.filter { $0 < pivot }
  let equal = a.filter { $0 == pivot }
  let greater = a.filter { $0 > pivot }

  return quickSort(less) + equal + quickSort(greater)
}

print("quickSort took \(measure(function: quickSort)) seconds\n")

// MARK: - BubbleSort
func bubbleSort(arrayToSort: [Int]) -> [Int] {
    var array = arrayToSort
    for i in 0..<array.count {
        for j in 1..<array.count {
            if array[j] < array[j-1] {
                let tmp = array[j-1]
                array[j-1] = array[j]
                array[j] = tmp
            }
        }
    }
    return array
}

print("bubbleSort took \(measure(function: bubbleSort)) seconds\n")
