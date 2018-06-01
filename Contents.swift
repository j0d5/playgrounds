//: Playground - noun: a place where people can play

enum State1 {
    case idle
    case requesting
    case releasing
    case open
    case suspended
}

class Request: CustomStringConvertible {
    enum isType {
        case request
        case release
    }
    
    var description: String {
        get {
            return "\(type(of: self)) Request"
        }
    }
}

protocol State: CustomStringConvertible {
    
    var previousRequests: [Request] { get set }
    
    func enterState(context: StateMachine, previousRequests: [Request])
//    func exitState()
}

class IdleState: State {
    var description: String = "IdleState"
    var previousRequests: [Request] = []
    
    func enterState(context: StateMachine, previousRequests: [Request]) {
        print("Entering state idle")
        print("Current requests: \(previousRequests)")
        self.previousRequests += previousRequests
        
        if !self.previousRequests.isEmpty {
            print("Sending request to connected device")
            context.state = RequestingState()
            context.enterState(requests: self.previousRequests)
        } else {
            print("No request, staying in idle")
        }
    }
}

class RequestingState: State {
    var description: String = "RequestingState"
    var previousRequests: [Request] = []
    
    func enterState(context: StateMachine, previousRequests: [Request]) {
        print("Entering state requesting")
        self.previousRequests += previousRequests
        
    }
}

class ReleasingState: State {
    var description: String = "ReleasingState"
    var previousRequests: [Request] = []
    
    func enterState(context: StateMachine, previousRequests: [Request]) {
        self.previousRequests = previousRequests
        
    }
}

class OpenState: State {
    var description: String = "OpenState"
    var previousRequests: [Request] = []
    
    func enterState(context: StateMachine, previousRequests: [Request]) {
        self.previousRequests = previousRequests

    }
}

class SuspendedState: State {
    var description: String = "SuspendedState"
    var previousRequests: [Request] = []
    
    func enterState(context: StateMachine, previousRequests: [Request]) {
        self.previousRequests = previousRequests
        
    }
}

class StateMachine {
    
    var state: State  = IdleState() {
        didSet {
            print(state)
        }
    }

    func enterState(requests: [Request]) {
        print("Current state: \(self.state)")
        self.state.enterState(context: self, previousRequests: requests)
    }
}

let machine = StateMachine()
var requests: [Request] = []

// Connected device sends 'IDLE'
machine.enterState(requests: requests)
// App requests AM
requests = [Request()]
// Process request
machine.enterState(requests: requests)


/*
protocol Statelike {
    func writeName(context: StateContext, name: String)
}

class StateLowerCase: Statelike {
    func writeName(context: StateContext, name: String) {
        print(name.lowercased())
        context.setState(newState: StateUpperCase())
    }
}

class StateUpperCase: Statelike {
    var count: Int = 0
    
    func writeName(context: StateContext, name: String) {
        print(name.uppercased())
        count += 1
        if count > 1 {
            context.setState(newState: StateLowerCase())
        }
    }
}

class StateContext {
    private var state: Statelike
    
    init() {
        self.state =  StateLowerCase()
    }
    
    func setState(newState: Statelike) {
        self.state = newState
    }
    
    func writeName(name: String) {
        self.state.writeName(context: self, name: name)
    }
}

let context = StateContext()
context.writeName(name: "Johannes")
context.writeName(name: "Johannes")
context.writeName(name: "Johannes")
context.writeName(name: "Johannes")
*/

