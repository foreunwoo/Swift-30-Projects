# Todo
## ScreenShot
![Todo](https://user-images.githubusercontent.com/57670228/112278090-cb2b7180-8cc5-11eb-9e87-4a1cc98b9254.gif)
## 회고
### Model
코드를 좀 더 객체 지향적으로 짤 수 있는 방법을 생각해 보다가
셀 안에 넣을 세 개의 라벨을 넘겨 받기 위해 Plan이라는 구조체를 만들고, 
Plan형의 배열을 생성해서 거기다 값을 채워넣는 방식으로 코드를 작성했다.
```swift
struct Plan { // Model
    let todo: String
    let location: String
    let date: String
    
    init(_ todo: String, _ location: String, _ date: String) {
        self.todo = todo
        self.location = location
        self.date = date
    }
}

var list: [Plan] = [] // Plan형 배열

let plan = Plan(self.todoTextField.text ?? "", self.locationTextField.text ?? "", self.dateTextField.text ?? "")

todoListVC?.list.append(plan) // 값 채워서 리스트에 넣기
```
### UIDatePicker, DateFormat
DatePicker로 얻은 값을 DateFormatter으로 변환을 한 뒤에, TextField에 삽입하는 방식을 사용했다.
DatePicker에 액션을 등록해서 값이 변경될 때마다 DateFormatter으로 변환이 일어나도록 했다.
```swift
let datePicker = UIDatePicker().then {
    $0.preferredDatePickerStyle = .wheels
    $0.datePickerMode = .date
    $0.backgroundColor = UIColor.white
    $0.layer.cornerRadius = 5.0
}

datePicker.addTarget(self, action: #selector(didChangeDate(sender:)), for: .valueChanged)

@objc func didChangeDate(sender: UIDatePicker){
    let dateFormatter: DateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy/MM/dd"
    
    let selectedDate: String = dateFormatter.string(from: sender.date)
    self.dateTextField.text = selectedDate
}
```
