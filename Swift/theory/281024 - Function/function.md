# Why use function?
- To avoid repeating code
- To make code more readable
- To make code more maintainable
- If you create a function well in advance, developers just need to use it, no need to create it again.
- Simplify repetitive code actions so we don't have to write the same code multiple times.
- Function is a block of code designed to perform a particular task.

# Function syntax

## Function declaration

```swift
func name(parameter: Type) -> ReturnType {
    // function body
}
```

## Function call

```swift
// 1. Basic fucntion
func greet() {
    print("Hello world!")
}
greet()

// 2. Function with parameter
func greet(name: String) {
    print("Hello, \(name)!")
}

greet(name: "Khanh.NVM")

// 3. Function with return value
func getName() -> String {
    return "Khanh.NVM"
}

print("Hello, \(getName())") // Hello, Khanh.NVM

// 4. Function with multiple parameters
func greet(name: String, age: Int) {
    print("Hello, \(name)! You are \(age) years old.")
}

greet(name: "Khanh.NVM", age: 20) // Hello, Khanh.NVM! You are 20 years old.

func add(a: Int, b: Int) -> Int {
    return a + b
}

print("a + b = \(add(a: 1, b: 4))") // a + b = 5
```

> [!NOTE]
> Parameter vs Argument
> - Parameter is the name of the variable in the function declaration
> - Argument is the value passed to the function when it is called


## Argument label

```swift
func add(firstNumber a: Int, secondNumber b: Int) -> Int {
    return a + b
}

// firstNumber, secondNumber are argument labels
print("a + b = \(add(firstNumber: 1, secondNumber: 4))") // a + b = 5
```
> [!NOTE]
> Argument Lable we could said that actually value of parameter when we call function 
> If you use argument label without specifying a seperate argument label, Swift will use the parameter name as the argument label.
> If you use an underscore `_` as the argument label, Swift will not use an argument label. You can omit the argument label when calling the function.

```swift
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

add(1, 4) // 5
```

## Variable parameter
Used for functions with an unknown number of arguments.

```swift
func sum(numbers: Int...) {
    var total = 0
    for number in numbers {
        total += number
    }
}

print(sum(numbers: 1, 2, 3, 4, 5)) // 15
```

## Default parameter value
You can set a default value for a parameter in the function declaration.

```swift
func greet(name: String = "Khanh.NVM") {
    print("Hello, \(name)!")
}

func add(_ a: Int = 1, _ b: Int = 2) {
    print("a + b = \(a + b)")
}

add() // a + b = 3
add(10) // a + b = 12
add(10, 20) // a + b = 30
```

## Function notation

As we saw above, we have four different ways to declare a function.

1. `func greet() { ... }` without return value or parameter
2. `func greet(name: String) { ... }` with parameter but without return value
3. `func greet() -> String { ... }` without parameter but with return value
4. `func greet(name: String) -> String { ... }` with parameter and return value (full function)

## Overloading function
Swift allows us to have multiple functions with the same name but different parameters and types. This is called function overloading.

```swift
func greet() {
    print("Hello, world!")
}

func greet(name: String) {
    print("Hello, \(name)!")
}

func doSomething(value: Int) {
    print("Do something with value: \(value)")
}

func doSomething(value: String) {
    print("Do something with value: \(value)")
}

func doSomething(value: Double) {
    print("Do something with value: \(value)")
}

func doSomething(value: Int, anotherValue: Int) {
    print("Do something with value: \(value) and anotherValue: \(anotherValue)")
}
```

## Function memory structure
1. When function is declared, Swift compiler will create a `function metadata` to store information about the function.
2. When function is called, Swift compiler will create a `stack frame` to store the local variables and parameters of the function.
3. When all contents of the function are executed, will be popped from the stack.
4. When function is returned, the `stack frame` will be destroyed and the `function metadata` will be removed.
5. Data created as global variables go into the data segment.

## inout parameter
Variables passed to function parameters are copied and only their values are used as arguments.

```swift
func swap(a: Int, b: Int) {
    let temp = a
    a = b
    b = temp
}

var num1 = 1
var num2 = 3

swap(a: num1, b: num2)

print("num1 = \(num1), num2 = \(num2)") // num1 = 1, num2 = 3
```
When implementing the `swap` function, if you define it as call-by-value, the values of `num1` and `num2` declared outside the function will not be changed.

The function have to implement as call-by-reference to change the values of `num1` and `num2`.

```swift
func swap(a: inout Int, b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var num1 = 5
var num2 = 15

swap(a: &num1, b: &num2)

print("num1 = \(num1), num2 = \(num2)") // num1 = 15, num2 = 5
```
`inout` parameters declared as keyword `&` before the parameter name.


## Reference
1. [TIL - Function](https://parkjju.github.io/vue-TIL/swift/221102-function.html#%E1%84%8B%E1%85%A7%E1%86%AB%E1%84%89%E1%85%B3%E1%86%B8%E1%84%86%E1%85%AE%E1%86%AB%E1%84%8C%E1%85%A6-%E1%84%80%E1%85%AA%E1%86%AB%E1%84%85%E1%85%A7%E1%86%AB)
