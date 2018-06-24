//: Playground - noun: a place where people can play

func test(param: Bool) -> String {
    if param {
        return "Test"
    }
    return nil
}

let tmp1 = test(param: true)
let tmp2 = test(param: false)

func testOptionalReturn(param: Bool) -> String? {
    if param {
        return "Test"
    }
    return nil
}

let tmp3 = testOptionalReturn(param: true)
print(type(of: tmp3))
let tmp4 = testOptionalReturn(param: false)
let tmp5 = testOptionalReturn(param: true)?
let tmp6 = testOptionalReturn(param: false)?
let tmp7 = testOptionalReturn(param: true)!
let tmp8 = testOptionalReturn(param: false)!

func testForceReturn(param: Bool) -> String! {
    if param {
        return "Test"
    }
    return nil
}

let tmp9 = testForceReturn(param: true)
let tmp10 = testForceReturn(param: false)
let tmp11 = testForceReturn(param: true)?
let tmp12 = testForceReturn(param: false)?
let tmp13 = testForceReturn(param: true)!
let tmp14 = testForceReturn(param: false)!
