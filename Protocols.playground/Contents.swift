//: Playground - noun: a place where people can play

import UIKit

protocol firstProtocol {
    func firstFunction() -> String
}

protocol secondProtocol {
    func firstSecondFunction()
}

var delegate: firstProtocol & secondProtocol

class Test: firstProtocol, secondProtocol {
    func firstFunction() -> String { return "Test succeeded" }
    func firstSecondFunction() {}
}

class TestStuff {
    
    init(delegate:firstProtocol & secondProtocol) {
        delegate.firstFunction()
    }
    
}

delegate = Test()

delegate.firstFunction()
