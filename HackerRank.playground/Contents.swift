/// # HackerRank Challenges

/// ## Sock Merchant
func sockMerchant(n: Int, ar: [Int]) -> Int {
    var set = Set<Int> ()
    var matches = 0

    for i in 0..<n {
        if set.update(with: ar[i]) != nil {
            matches += 1
            set.remove(ar[i])
        }
    }
    return matches
}

sockMerchant(n: 9, ar: [ 10, 20, 20, 10, 10, 30, 50, 10, 20 ])
sockMerchant(n: 10, ar: [ 1, 1, 3, 1, 2, 1, 3, 3, 3, 3 ])

/// ## Counting Valleys
func countingValleys(n: Int, s: String) -> Int {
    var valleys = 0
    var previousChar = Character("0")

    if s.first == "U" {
        valleys += 1
    }
    s.forEach({ (char) in
        if char == "U" && previousChar == "D" {
            valleys += 1
        }
        previousChar = char
    })

    return valleys
}

countingValleys(n: 8, s: "UDDDUDUU")


// Complete the solve function below.
func solve(meal_cost: Double, tip_percent: Int, tax_percent: Int) -> Void {
    let tip_cost = meal_cost * Double(tip_percent) / 100
    let tax_cost = meal_cost * Double(tax_percent) / 100
    let total = meal_cost + tip_cost + tax_cost
    print(Int(total.rounded()))
}

solve(meal_cost: 12, tip_percent: 20, tax_percent: 8)


//If  is odd, print Weird
//If  is even and in the inclusive range of 2 to 5, print Not Weird
//If  is even and in the inclusive range of 6 to 20, print Weird
//If  is even and greater than 20, print Not Weird

let N = 6

if N%2 == 0 && (N >= 2 && N <= 5 || N > 20) {
    print("Not Weird")
} else {
    print("Weird")
}

func printEvenAndOdd(string: String) {
    // This prints inputString to stderr for debugging:
    // fputs("string: " + string + "\n", stderr)

    // Print the even-indexed characters
    // Write your code here
    let enumeratedString = string.enumerated()
    for item in enumeratedString {
        if item.offset%2 == 0 {
            print(item.element, terminator: "")
        }
    }

    // Print a space
    print(" ", terminator: "")

    // Print the odd-indexed characters
    // Write your code here
    for item in enumeratedString {
        if item.offset%2 != 0 {
            print(item.element, terminator: "")
        }
    }
    // Print a newline
    print()
}

printEvenAndOdd(string: "Hacker")

func compareTriplets(a: [Int], b: [Int]) -> [Int] {
    var points = [0, 0]

    for i in 0..<3 {
        if a[i] > b[i] {
            points[0] += 1
        } else if a[i] < b[i] {
            points[1] += 1
        }
    }
    return points
}
compareTriplets(a: [5,6,7], b: [3,6,10])
compareTriplets(a: [17,28,30], b: [99,16,8])


func aVeryBigSum(ar: [Int]) -> Int {
    return ar.reduce(0) { (x, y) -> Int in
        x + y
    }

}

aVeryBigSum(ar: [1000000001, 1000000002, 1000000003, 1000000004, 1000000005])


var n = [ 1, 4, 3, 2 ]
for element in n.reversed() {
    print(element, terminator: " ")
}
print("\n\n")


/// ## Repeated String
func repeatedString(s: String, n: Int) -> Int {
    var string = ""
    while string.count < n {
        string.append(s)
    }
    return string.prefix(n).filter({character -> Bool in character == "a"}).count
}

let s = "aba"
print(repeatedString(s: s, n: 10))


/// # Remove Duplicates from Sorted Array
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count == 0 { return 0 }

        var i = 0
        for j in 1..<nums.count {
            if nums[j] != nums[i] {
                i += 1
                nums[i] = nums[j]
            }
        }
        return i + 1
    }
}

var nums = [0,0,1,1,1,2,2,3,3,4]

print(nums)
print(Solution().removeDuplicates(&nums))
print(nums)
