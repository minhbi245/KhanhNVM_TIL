# Array in Swift

> Như các ngôn ngữ khác Array cho phép ta chứa nhiều dữ liệu có cùng kiểu (data type) 

- Các phần tử trong 1 Array được truy cập bởi `index`
- `index` trong Array bắt đầu từ số 0

## Các cách khởi tạo một Array Empty

``` swift
    // Cách 1
    let arrNumbers: [Int] = [Int]()

    // Cách 2
    let arrDoubles: [Double] = []

    // Cách 3 
    let arrString: [String] = Array<String>()
```

## Cách tạo Array và có giá trị trong đó

``` swift

    // With String
    let studentNames: [String] = ["Jack", "Susan", "John", "Gordon"]


    // Numbers
    let numbers: [Int] = [1, 5, 12, 15, 20]
```

## Các phương thức và properties được sử dụng với Array

``` swift

    let numbers: [Int] = [5, 10, 52, 50]

    // Property first
    let firstNumber = numbers.first // lấy giá trị phần tử đầu tiên trong mảng số nguyên numbers -> firstNumber sẽ có giá trị là 5

    // Property last
    let lastNumber = numbers.last // Lấy giá trị của phần tử cuối cùng trong mảng numbers -> lastNumber sẽ có giá trị là 50

    // method firstIndex(of: )
    let getIndexByValue = numbers.firstIndex(of: 10) // Phương thức cho phép ta lấy index tại phần tử có giá trị tương ứng
                                                     // ở phần tử có giá trị là 10 thì index là 1

    // method removeFirst()
    let firstValue = numbers.removeFirst() // cho phép ta xóa và lấy ra giá trị phần tử đầu tiên -> firstValue sẽ bằng 5

    // Để thêm phần tử vào một mảng ta sẽ dùng phương thức append()
    // phương thức append() này được sử dụng khi ta tạo ra một mảng rỗng chưa có bất kì phần tử nào trong mảng
    // Array empty sẽ khác với khái niệm mảng nil, mảng empty là đã được cấp phát trên vùng nhớ còn mảng optional nil thì chưa được cấp phát trên memory

    let anotherNumbers: [Int] = [Int]() // cách tạo ra mảng empty

    // Để thêm phần tử vào ta sẽ phải sử dụng phương thức append()
    // không thể sử dụng cú pháp đưa giá trị phần tử bằng index vì lúc này chưa có bất kì phần tử giá trị nào trong mảng
    // Chương trình chưa định nghĩa được index từ 0 -> số lượng phần tử có trong mảng

    anotherNumbers[0] = 15 // trình biên dịch sẽ báo lỗi

    anotherNumbers.append(15) // như thế này chương trình không báo lỗi -> anotherNumbers[0] có giá trị là 15 vì append sẽ chèn phần tử vào và index lúc này sẽ bắt đầu được sinh ra là 0

    // append() cho phép chèn thêm giá trị phần tử vào tiếp theo hoặc cuối của mảng đó
    anotherNumbers.append(30) // [15] -> [15, 30]

    // Phương thức insert(_: at:) phương thức cho phép chèn phần tử tại vị trí mà ta mong muốn
    anotherNumbers.append(22) // [15, 30, 22]

    // Using insert
    anotherNumbers.insert(50, at: 1) // [15, 50, 30, 22]

    // method remove(at:) cho phép ta xóa giá trị phần tử tại index mong muốn
    anotherNumbers.remove(at: 2) // [15, 50, 30, 22] -> [15, 50, 22] (phần tử giá trị 30 ở index là 2 bị xóa ra khỏi mảng anotherNumbers)


```

## Problems to practice about Arrays
- [1. Two Sum - Leetcode - Easy](https://leetcode.com/problems/two-sum/description/) **
- [26. Remove Duplicates from Sorted Array - Easy](https://leetcode.com/problems/remove-duplicates-from-sorted-array/description/?envType=problem-list-v2&envId=array) **
- [27. Remove Element - Easy](https://leetcode.com/problems/remove-element/description/?envType=problem-list-v2&envId=array) **