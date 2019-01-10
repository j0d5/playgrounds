import UIKit

var str = "Hello, playground"



struct Car {
    var speed = 0

    mutating func changeSpeed(speed: Int) {
        self.speed = speed
    }
}

var car = Car(speed: 10)
car.speed = 20
print(car.speed)
car.changeSpeed(speed: 30)
print(car.speed)
