# CustomFont
## ScreenShot
![CustomFont](https://user-images.githubusercontent.com/57670228/112586612-757ad480-8e3f-11eb-9f7a-17728cff5b39.gif)
## 회고
### UITextView 동적 높이 할당
텍스트뷰 안에 있는 글자 수에 따라, 텍스트뷰의 높이가 조정되도록 만들었다.
~~~swift
let customTextView = UITextView().then {
    $0.sizeToFit()
    $0.translatesAutoresizingMaskIntoConstraints = true
    $0.isScrollEnabled = false
}
~~~
우선 sizeToFit으로 텍스트에 맞게 텍스트뷰의 사이즈가 조절되도록 만들었다.
그리고 뷰의 autoresizing mask가 Auto Layout constraints으로 변환되도록 설정했고,
isScrollEnabled를 false로 설정함으로서 스크롤 기능을 막았다.
</br>

참고한 사이트 
*  <https://zeddios.tistory.com/474>
*  <https://woongsios.tistory.com/3>
