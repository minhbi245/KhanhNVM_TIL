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
> Int, Double, Char, Float, String được tạo với Struct trong Swift -> Object Data Type
> Int đại diện các kiểu số nguyên, Int ở Swift có thể chứa giá trị số nguyên lớn tận 64bit
> Float hay Double đại diện cho các kiểu dữ liệu số thực
> Char đại diện cho kiểu kí tự trong Swift
> String thì đại diện cho chuỗi kí tự, ngoài ra String cũng có thể hiểu là Array kí tự