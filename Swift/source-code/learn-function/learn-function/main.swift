//
//  main.swift
//  learn-function
//
//  Created by khanhnvm on 28/10/24.
//

import Foundation

// Function declaration
/*
 func name(parameter: Type) -> ReturnType {
 }
 */

// 1. Basic function
func greet() {
    print("Hello World! 👋")
}
greet()

// 2. Function with parameter
func greet(name: String) {
    print("Hello \(name)")
}

greet(name: "KhanhNVM")

// 3. Function with return value
func sayHello() -> String {
    return "Hello World!"
}

print(sayHello())

//4. Function with return value and multiple parameters
func sum(a: Int, b: Int) -> Int {
    return a + b
}

print("a: 5, b: 6, sum: \(sum(a: 5, b: 6))")

// MARK: - Argument Label
func sum(firstNumber a: Int, secondNumber b: Int) -> Int {
    return a + b
}

print("First number: 5, second number: 15, sum: \(sum(firstNumber: 5, secondNumber: 15))")

// Argument with underscore
func multiply(_ a: Int, _ b: Int) -> Int {
    return a * b
}
print("Multiply - a: 15, b: 20, result: \(multiply(15, 20))")

// MARK: - Default Parameters
func divide(_ a: Int, _ b: Int = 2) -> Int { // with parameter b default value: 2
    return a / b
}

print("Divide with default value b: 2 - a: 10, b: 2, result: \(divide(10, 2))")


// MARK: - inout parameter
func swap(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var a = 10
var b = 25
print("Before swap: a: \(a), b: \(b)")
swap(&a, &b)
print("After swap: a: \(a), b: \(b)")
