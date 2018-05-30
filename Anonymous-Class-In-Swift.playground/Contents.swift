//: Playground - noun: a place where people can play

import UIKit

var str = "Anonymous Class in Swift"

//https://stackoverflow.com/questions/24408068/anonymous-class-in-swift
//There is no equivalent syntax.
//Regarding equivalent techniques, theoretically you could use closures and define structs and classes inside them.


protocol SomeProtocol {
    func hello()
}

let closure: () -> () = {
    class NotSoAnonymousClass : SomeProtocol {
        func hello() {
            print(#line, #function, "Hello")
        }
    }
    let object = NotSoAnonymousClass()
    object.hello()
}

print(#line, #function, "closure]:", closure())
//print(#line, #function, "closure]:", (closure)())
//Example how to call it: (closure)()

let closureTwo = {
    class NotSoAnonymousClass : SomeProtocol {
        func hello() {
            print(#line, #function, "-Hello Two")
        }
    }
    let object = NotSoAnonymousClass()
    object.hello()
}

print(#line, #function, "closureTwo]:", closureTwo())


// https://stackoverflow.com/questions/24408068/anonymous-class-in-swift

class EmptyClass {
    
    var someFunc: () -> () = { }
    
    init(overrides: (EmptyClass) -> EmptyClass) {
        overrides(self)
    }
}

// Now you initialize 'EmptyClass' with a closure that sets
// whatever variable properties you want to override:

let workingClass = EmptyClass { ec in
    ec.someFunc = {  print("It worked!") }
    return ec
}

workingClass.someFunc()  // Outputs: "It worked!"

/*
 It is not technically 'anonymous' but it works the same way. You are given an empty shell of a class, and then you fill it in or override whatever parameters you want when you initialize it with a closure.
 
 It's basically the same, except instead of fulfilling the expectations of a protocol, it is overriding the properties of a class.
 */

class EmptyClassTwo {
    
    var someFunc: (_ s: String) -> () = { s in }
    
    init(overrides: (EmptyClassTwo) -> EmptyClassTwo) {
        overrides(self)
    }
}

// Now you initialize 'EmptyClass' with a closure that sets
// whatever variable properties you want to override:

let workingClassTwo = EmptyClassTwo { ec in
    ec.someFunc = { s in print("It worked!:", s) }
    return ec
}

workingClassTwo.someFunc("test two")  // Outputs: "It worked!: test two"






protocol EventListener {
    func handleEvent(event: Int) -> ()
}

class Adapter : EventListener {
    func handleEvent(event: Int) -> () {
        
    }
}

var instance: EventListener = {
    class NotSoAnonymous : Adapter {
        override func handleEvent(event: Int) {
            print("Event: \(event)")
        }
    }
    return NotSoAnonymous()
}()

instance.handleEvent(event:10)



protocol SomeV {
    var vm: (() -> ())? { set get }
}


struct NewStruct: SomeV {
    var vm: (() -> ())?
    
    func someFuncTwo() {
        print(#line, #function, "Inside NewStruct - func Two -- func two")
    }
}

func someFunc() {
    print(#line, #function, "MM-Test-func -- func")
}

func someFuncThree() {
    print(#line, #function, "Three-T-func -- func")
}

var n = NewStruct(vm: someFunc)
//(n.vm!)()
//print(#line, #function, "[1-dbg:n]", (n.vm!)())
print(#line, #function, "dbg:n]", n.vm!()) //this works as well

//New instance of 'NewStruct':
var nTwo = NewStruct()
nTwo.vm = nTwo.someFuncTwo
//(nTwo.vm!)()
nTwo.vm!() //this works as well

nTwo.vm = someFunc
print(#line, #function, "[2-dbg:n]", nTwo.vm!())

nTwo.vm = someFuncThree
print(#line, #function, "[3-dbg:n]", nTwo.vm!())





//https://stackoverflow.com/questions/29095284/anonymous-inner-class-in-swift

//You cannot instantiate a protocol in Swift.
//You can however have an internal class and implements this.
protocol SomeCallback {
    func done() -> Void
}

class External {
    
    class Internal : SomeCallback {
        func done() {
            // does something
            print(#line, #function, "Something is done.")
        }
    }
    let int = Internal()
    
    func test(_ callback : SomeCallback) {
        //additional work via callback
        print(#line, #function, "[dbg]: - do some more --.")
        callback.done()
    }
}

let ex = External()
//print(ex.int.done())
ex.test(ex.int) //callback
