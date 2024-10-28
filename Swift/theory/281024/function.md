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
