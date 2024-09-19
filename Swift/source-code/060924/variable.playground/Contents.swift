import UIKit

var numberIneger: Int = 252
var numberFloat: Float = 5.2
var numberDouble: Double = 25.2552
let myName: String = "KhanhNVM"
var isCorrect: Bool = true // Data type Boolean

func sayHello() {
    print("Hello \(myName)")
}

func printOut() {
    print(numberIneger)
    print(numberFloat)
    print(numberDouble)
}

// Call function
sayHello()
printOut()


struct StructureName {
    // Các properties
    // Các method
}

struct Person {
    //properties
    var name: String
    var age: Int
    
    // Method/function
    func displayInfo() {
        print("Name: \(name)\n Age: \(age)")
    }
}

// Syntax create an instance
let julian = Person(name: "Julian", age: 20)
