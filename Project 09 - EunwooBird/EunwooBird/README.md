# EunwooBird
## ScreenShot
![EunwooBird](https://user-images.githubusercontent.com/57670228/114263705-224d7800-9a22-11eb-8c84-541bfafdfee5.gif)
## 얻은 것
### UIImageView 동그랗게 커스텀하는 방법
```swift
_ = profileImageView.then {
    $0.image = UIImage(named: "cat.jpeg")
    $0.layer.cornerRadius = 0.5 * profileImageView.frame.size.width
    $0.contentMode = .scaleAspectFill
    $0.clipsToBounds = true
}
```
