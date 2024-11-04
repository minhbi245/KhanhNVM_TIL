# Có những điểm ta cần biết và hiểu vì sao sẽ cần sử dụng lazy var.

## Vậy lazy là gì trong ngôn ngữ Swift?
> Lazy được sử dụng để nhầm khai báo một property trong một class nhầm mục đích tối ưu hóa về mặt load lên một UIViewController hoặc một UIView trong iOS. Vì sao lại thế?
### Vì đối với một UIViewController sẽ bao gồm các trạng thái sau:
 - **Not yet loaded**: đây là trạng thái mà một view controller chưa được load lên phân cấp chế độ xem trên bộ nhớ, hoặc có thể hiểu lúc này một instance của một UIViewController chưa được khởi tọa và load vào bộ nhớ
 - **Loaded**: Lúc này thì instance của UIViewController đã được loaded và phân cấp chế độ view đã được cấp phát vào memory, tuy nhiên lúc này thì screen của nó vẫn chưa được hiển thị. lúc này hàm `viewDidLoad` sẽ được gọi và thực thi
 - **Appearing**: ở trạng thái này thì instance của UIViewController đang trong quá trình được thêm vào phân cấp view và hiển thị màn hình. Lúc này đây thì method `viewWillAppear` đang được gọi để thực thi
- **Visible**: ở trạng thái này thì đối tượng của view controller đã hoàn toàn hiển thị đầy đủ với các thông báo và thông tin cũng như sự kiện đã được truy xuất đầy đủ. Ở trạng thái này thì method `viewDidAppear` sẽ được gọi và thực thi.
 - **Disappearing**: ở trạng thái này thì đối tượng view controller đang trong tiến trình được xóa khỏi phân cấp view và sẽ không hiển thị trên screen nữa. lúc này đây thì method `viewWillDisappear` được gọi và thực thi.
- **Unloaded**: instance của view controller sẽ bị xóa khỏi phân cấp view và cũng sẽ bị unloaded trên memory, trong suốt trạng thái này thì hàm `deinit` sẽ được gọi và thực thi để xem instance này có hoàn toàn hủy cấp phát trên memory không.

## Vậy tại sao ta cần hiểu về state của UIViewController?
- Bạn cần hiểu được vì sẽ liên quan đến property được khai báo bên trong một instance của một UIVIewController. 
- Vì bản chất `lazy` keyword sẽ làm cho property đó thực sự cấp phát vào memory khi ta thật sự gọi tới nó hoặc truy cập vào property đó.
``` swift
class DataManager {
    lazy var data: [String] = {
        // Giả sử việc tải dữ liệu từ mạng hoặc đĩa là tốn kém
        print("Loading data...")
        return ["Apple", "Banana", "Cherry"]
    }()
    
    func fetchData() {
        print("Fetching data...")
        print(data)
    }
}

let manager = DataManager()
// Chưa có thông báo "Loading data..." vì thuộc tính `data` chưa được truy cập
manager.fetchData()
// Output:
// Fetching data...
// Loading data...
// ["Apple", "Banana", "Cherry"]
```

### Giải thích:
- Thuộc tính data chỉ được khởi tạo khi phương thức fetchData() được gọi và truy cập data.
- Nếu fetchData() không được gọi, data sẽ không bao giờ được khởi tạo, tiết kiệm tài nguyên.

## Code ví dụ ứng dụng `lazy` trong `UIViewController`
``` swift
class ViewController: UIViewController {
    lazy var button: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Click Me", for: .normal)
        btn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
    }
    
    @objc func buttonTapped() {
        print("Button was tapped!")
    }
}

```
### Giải thích:
- Thuộc tính button sử dụng `self` trong closure để thêm hành động `(addTarget)`.
- Bằng cách khai báo button là `lazy`, chúng ta đảm bảo rằng `self` đã được khởi tạo khi thuộc tính button được khởi tạo, tránh được các vấn đề về vòng lặp khởi tạo.
- Ngoài ra khi instance của ViewController này được loaded hoàn toàn trên memory, thì ở hàm `viewDidLoad` mới thật sự được thực thi, lúc này ta mới khởi tạo cho button vào `addSubView` việc này làm cho việc khởi tạo ban đầu của instance ViewController cũng được nhanh hơn.

## Lợi ích của việc sử dụng khai báo `lazy`
- Giúp cho ta tiết kiệm tài nguyên lúc khởi tạo một instance của một Type nào đấy hoặc cả `UIViewController` 
- Giúp tăng hiệu năng khi launch app hoặc khởi chạy nên màn hình nào đó vào phân cảnh của view
- Tăng được tính linh hoạt, đôi khi instance của ViewController đó không nhất thiết khởi tạo property đó, chỉ khi cần đến lúc thực thi truy cập mới cần thì giúp tiết kiệm thời gian load cũng như tài nguyên trên memory
- Có thể sử dụng để tăng độ mượt cho scroll áp dụng vào UITableView hay UICollectionView -> **cơ chế gọi là lazy loading**

## Những điểm cần lưu ý với việc sử dụng khi khai báo `lazy`
- Nếu như đồng thời có hai Thread có task cùng thực hiện truy cập vào khởi tạo property lazy điều này làm cho property này khởi tạo nhiều lần -> dẫn đến việc tạo ra dữ liệu không nhất quán.
** Ví dụ sau**:
``` swift
class DataManager {
    lazy var data: [String] = {
        // Giả sử việc tải dữ liệu từ mạng là tốn kém
        print("Loading data...")
        // Giả lập tải dữ liệu
        sleep(2)
        return ["Apple", "Banana", "Cherry"]
    }()
    
    func fetchData() {
        print("Fetching data...")
        print(data)
    }
}

// Sử dụng trong môi trường đa luồng
let manager = DataManager()
DispatchQueue.global().async {
    manager.fetchData()
}
DispatchQueue.global().async {
    manager.fetchData()
}

Fetching data...
Fetching data...
Loading data...
Loading data...
["Apple", "Banana", "Cherry"]
["Apple", "Banana", "Cherry"]

```

## Giải quyết vè vấn đề Thread - Safety:
- Ở đây có nhiều cách, nhưng anh sẽ đề cập đến sử dụng DispatchQueue để anh em dễ hình dung và dễ sử dụng. Thật ra thì có thể sử dụng DispatchSemaphore

``` swift
class DataManager {
    private let dataQueue = DispatchQueue(label: "com.example.DataManager.dataQueue")
    
    lazy var data: [String] = {
        print("Loading data...")
        // Giả lập tải dữ liệu
        sleep(2)
        return ["Apple", "Banana", "Cherry"]
    }()
    
    func fetchData() {
        dataQueue.sync {
            print("Fetching data...")
            print(data)
        }
    }
}

// Sử dụng trong môi trường đa luồng
let manager = DataManager()
DispatchQueue.global().async {
    manager.fetchData()
}
DispatchQueue.global().async {
    manager.fetchData()
}

```

### Giải Thích:
- Bằng cách đặt việc truy cập data bên trong dataQueue.sync, bạn đảm bảo rằng chỉ một luồng có thể truy cập và khởi tạo data tại một thời điểm.
- Sau khi data được khởi tạo lần đầu, các lần truy cập tiếp theo sẽ không kích hoạt lại việc khởi tạo.