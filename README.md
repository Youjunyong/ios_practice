# ios_practice


# #1

사용자에게 입력값을 받아, `dismiss`하면 이전 View에서 그 값을 띄워준다.

<img width = "30%" src = "https://user-images.githubusercontent.com/46234386/132442079-92f33cf2-0e0e-4c81-94d7-ec8719525d4a.gif"/>


### 연습 목적

1. Delegate패턴을 통하여 이전화면으로 값 전달 하기.
2. Protocol 을 직접 작성하고, 이전ViewController를 다음ViewController의 델리게이트로 지정하는 연습.



# #2

간단한 퀴즈 앱을 만들어보았다.

<img width="30%" src="https://user-images.githubusercontent.com/46234386/132441394-07f02f22-c518-4d38-b862-eef8a33326bb.gif"/>


### 연습 목적

1. `present` 를 통한 화면 전환.
2. Delegate 패턴을 통하여 이전 화면으로 값 전달하기.
3. Singleton 패턴을 통해 데이터 전달하기.
4. Local 푸시 알람 (`UserNotifications`  사용)
5. `UIAlertController` 를 사용하여 알림창 띄우기
 ++ UIImagePicker 이미지피커!
 
 
 
 # #3
 
 iOS에서 HTML(웹 페이지)를 렌더링하는 3가지 방법을 구현해보았다.
 
 <img width="30%" src = "https://user-images.githubusercontent.com/46234386/132443727-19571878-d279-47b5-a122-46dabd7ce4e7.gif"/>
 
 
 ### 연습 목적
 1. String으로 된 URL주소를 통해 URLRequest요청하기.
 2. ULR을 통해 Safari앱을 호출하여 페이지 열기.
 3. WKWebView 사용해서 페이지 열기.
 4. SFSafariViewController 사용해서 페이지 열기.

웹 뷰는 자주 사용할일이 없을것 같아 글로 정리했다. -> https://infinitt.tistory.com/377




# #4

AutoLayout을 연습하기 위해서 카카오톡 프로필페이지를 만들어보았다.

<img width="30%" src = "https://user-images.githubusercontent.com/46234386/132615976-fea6ac12-da0c-4593-b15b-cd883d17ae8e.gif"/>

### Guide line (개발자문서)
![image](https://user-images.githubusercontent.com/46234386/132448227-294f7828-af37-4019-8b48-c40b43a61606.png)

* 제약의 Constant는 되도록 양수로 만들어야 한다. 
  * 음수가 된다면  First Item, Second Item를 reverse 시켜 양수로 바꾸기.
* multiplier는 소수보다 정수로
* 가능한 View는 Layout 순서대로 나타내야한다. 
* View의 제약은 되도록 가까운 뷰와 연결지어 생성하라.
* View의 정의를 frame, bounds, center를 통해 정의하지 마라.
  * (이 프로퍼티들은 과거에 frame-based layout에서 사용하던것들)
* 가능한 상황이라면 되도록 StackView를 사용할것.




### 연습 목적 및 기억할 포인트
1. AutoLaout연습 - 적절한 Constraint 추가 , StackView 사용, 
2. 글자 및 아이콘이 흰색이다. 만약 사용자가 백그라운드를 흰색계열로 한다면 가독성은 어떻게할까?
 -> Background Dimming View를 추가한다. (Alpha값으로 투명도를 주고, 검정색 View로 덮어 최소한의 가독성을 확보한다.)
3. 프로필 사진의 모서리가 둥글다. 어떻게 구현할까 ?
`imageView.layer.cornerRadius = imageView.frame.width/3`
`//imageView.clipsToBounds = true // 내부에 SubView가 있을때 사용한다. 이번 연습에서는 필요없음`
4. TextLabel은 Intrinsic size 적용할것.
5. **화면을 회전했을때도 고려해서 SuperView와 SafeArea와 Constraint 주기.**

- dimming View를 구현하고 나니 Status Bar의 디폴트는 검정색이다. 어떻게 하면 흰색으로 바꿀까?
    - UIApplication안의 enum인 UIStatusBarStyle

![image](https://user-images.githubusercontent.com/46234386/132616118-c46012ed-6a46-4ac5-9ab4-3ec2e874caee.png)

```swift
ovveride var preferredStatusBarStyle: UIStatusBarStyle{
	return  .lightContent
}
```


