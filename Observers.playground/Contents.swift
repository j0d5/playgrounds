//: Playground - noun: a place where people can play

import UIKit

enum State {
    
    case playing
    case suspended
    case stopped
    
}

class AudioPlayer {
    
    private var stateObservation = [ UUID: (AudioPlayer, State) -> Void ]()
    
}

extension AudioPlayer {
    @discardableResult
    func addPlaybackStartedObserver<T: AnyObject>(_ observer: T, closure: @escaping (T, AudioPlayer, State) -> Void) -> ObservationToken {
        let id = UUID()
        
        self.stateObservation[id] = { [weak self, weak observer] player, state in
            // If the observer has been deallocated, we can
            // automatically remove the observation closure.
            guard let observer = observer else {
                self?.stateObservation.removeValue(forKey: id)
                return
            }
            
            closure(observer, player, state)
        }
        
        return ObservationToken { [weak self] in
            self?.stateObservation.removeValue(forKey: id)
        }
    }
    
}

private extension AudioPlayer {
    
    func stateDidChange(to state: State) {
        self.stateObservation.forEach { closure in
            print("Notifying observer: \(closure)")
            closure.value(self, state)
        }
    }
    
}

class ObservationToken {
    private let cancellationClosure: () -> Void
    
    init(cancellationClosure: @escaping () -> Void) {
        self.cancellationClosure = cancellationClosure
    }
    
    func cancel() {
        cancellationClosure()
    }
}

private extension Dictionary where Key == UUID {
    
    
    /// Add the value with an associated UUID.
    ///
    /// - Parameter value: <#value description#>
    /// - Returns: <#return value description#>
    mutating func insert(_ value: Value) -> UUID {
        self[id] = value
        return id
    }
}

class ObserverTest {
    
    let player = AudioPlayer()
    
    private var observationToken: ObservationToken?
    
    init() {
        self.observationToken = self.player.addStateObserver(self) { (observationToken, player, state) in
            print("\(self):\(state)")
        }
    }
    
    func play(_ string: String) {
        self.player.stateDidChange(to: .playing)
    }
    
    func stop() {
        self.player.stateDidChange(to: .stopped)
        self.observationToken?.cancel()
    }
}

let test1 = ObserverTest()
test1.play("Test")
test1.play("Test")
test1.stop()
test1.play("Test no Notif")
