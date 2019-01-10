//: Playground - noun: a place where people can play

var test = 0xF


var bit = 0b0110
let negatedBit = test & ~bit

print(String(test, radix: 2))
print("0\(String(bit, radix: 2))")
print(String(negatedBit, radix: 2))



bit = 0b0110
let xorBit = test ^ bit

print(String(test, radix: 2))
print("0\(String(bit, radix: 2))")
print(String(xorBit, radix: 2))

var shiftTest = 0
shiftTest = 1 << 5
