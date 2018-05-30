//: Playground - noun: a place where people can play

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


