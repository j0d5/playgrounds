//: Playground - noun: a place where people can play

let array = ["Initial1", "Initial2", "Initial3Test", "Init3Test", "Intial1"]

// Returns the mapped result { (String) -> Int }
let mapped = array.map({ $0.count })
print(mapped)

// Returns filtered result { (String) -> String }
let filtered = array.filter({ $0.hasPrefix("Initial") })
print(filtered)

// Returns a reduces result { (String, String) -> String }
let reduced = array.reduce("", { "\($0.prefix(3))\($1.suffix(3))" })
print(reduced)

// Returns a filtered mapped result { (String) -> String? }
let filteredMap = array.compactMap({ $0.contains("1") ? $0 : nil })
print(filteredMap)

