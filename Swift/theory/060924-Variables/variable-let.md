# var & Let

- Trong ngôn ngữ Swift để khai báo một biến ta có thể sử dụng hai từ khóa là `var` và `let`
- `var` chính là khai báo xin cấp một vùng nhớ để chứa giá trị tương ứng với kiểu dữ liệu mà ta mong muốn
- `let` cũng là xin vùng nhớ để chứa giá trị tương ứng với kiểu dữ liệu, tuy nhiên value của `let` khi nhận được rồi thì không thể thay đổi được
`var` thì ngược lại khi ta đã gán giá trị trước đó cho biến được khai báo với `var` thì sau đó ta có thể thay đổi lại giá trị đã cho

```swift
    var number1: Int = 22
    let number2: Int = 15

    number1 = 25    // có thể thay đổi giá trị của biến var với name là number1 thành 25
    number2 = 11    // ở biến thứ hai với tên là number2 được khai báo là hằng số
                    // Lúc này nếu cố tình thay đổi giá trị được gán trước đó thành 11 thì sẽ báo lỗi do compiler

```

- Mọi kiểu dữ liệu ở Swift đều là Object Data Type kể cả kiểu dữ liệu cơ bản là Int, Double, Char, String, etc
> `Int`, `Double`, `Char`, `Float`, `String` được tạo với Struct trong Swift -> Object Data Type
- `Int` đại diện các kiểu số nguyên, `Int` ở Swift có thể chứa giá trị số nguyên lớn tận 64bit
- `Float` hay `Double` đại diện cho các kiểu dữ liệu số thực
- `Char` đại diện cho kiểu kí tự trong Swift
- `String` thì đại diện cho chuỗi kí tự, ngoài ra String cũng có thể hiểu là Array kí tự

## Vậy tại sao chúng ta lại cần biến? và phải khai báo biến trong lập trình
> Như đã nói ở trên bất kì ngôn ngữ lập trình nào cũng cần có biến, vì đây là nơi ta báo cho hệ điều hành đang sử dụng mở ứng dụng của chúng ta lên
> khi này những biến mà chúng ta khai báo sẽ được cấp phát vào vùng nhớ với kiểu giá trị tương ứng như `Int`, `Float` hoặc kí tự hoặc chuỗi `Char` `String`. 
> Trong lập trình điều cơ bản là phải có biến thì mới đọc được giá trị cũng như lấy được giá trị từ biến và hiển thị cho người dùng hoặc sử dụng vào tùy mục đích trong chương trình của chúng ta, việc biến có thể được thực thi khi được đưa vào hàm và sử dụng chạy các giá trị đấy, phần về hàm/function/method chúng ta sẽ tìm hiểu sau

``` swift

    var myName: String = "KhanhNVM" // biến được khai báo với keyword var nghĩa là có thể thay đổi được giá trị
                                    // Biến có tên là `myName` và có kiểu dữ liệu là một chuỗi
    
    func syHello() {
        print("Hello \(myName)")    // Để có thể sử dụng giá trị của biến myName ta chỉ cần gọi tên biến đó ra là đã lấy giá trị từ biến đó
                                    // biến `myName` được đọc giá trị và thực thi khi được chạy bởi hàm `print()`
    }

    // Khi ta gọi hàm syHello() thì lệnh bên trong {} sẽ được thực hiện
    syHello() // hàm được gọi và sẽ chạy các câu lệnh bên trong khối {}
```