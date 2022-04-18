---
layout: posts
comments: true
title : "Github Wakatime 적용하기"
categories: Development
tags: [Git, Wakatime, Visual Studio]
---

### Github Profile Page 에 Waka time 보이게 하기.

[WakaTime 공식 홈](https://wakatime.com/)

Wakatime 공식 홈페이지에 방문하여 회원가입 및 자기가 주로 사용하는 개발툴을 등록한다.

### Visual Studio Code

[공식 홈 참고](https://wakatime.com/vs-code)

WakaTime 확장을 검색하여 설치한다.

설치 후 VS Code 를 재시작하면 API Code 를 입력하라고 한다.

API 코드는 WakaTime 공식 홈에서 복사하면 된다.

이제부터 사용하는 Tool 의 시간이 자동으로 측정되기 시작한다.

어떤 Tool 을 사용했는지, 어떤 언어를 사용했는지, 어떤 Project 작업중인지...

일단 좀 더 사용하면서 추세를 봐야할 듯 하다.

### Visual Studio 2017

[공식 홈 참고](https://wakatime.com/visual-studio)

VS Code 와 같은 방법으로 확장을 검색 후 설치하고, 재시작한다.

VS 2017은 VS Code 에서 API 코드를 등록해서 따로 등록하라고 하지는 않았다.

WakaTime 홈페이지에서는 계정당 하나의 API Key 를 관리하는 듯하다.

---
이렇게 두 개의 Tool 을 설정하고 Wakatime Dashboard 에 아래와 같이 표시가 된다.

![WakaTime Dashboard](/assets/images/waka_dashboard.JPG)

마지막으로 GitHub Profile 에 적용이 안되어서 확인해보니...

Username 이 지정되어 있지 않았다. 

username 수정 후 아래와 같이 정상 적용 확인.

[나의 Github Profile](https://github.com/jcseo1028) 


---
개발툴 외에도 각종 도구들의 확장을 제공하니, 필요한 도구의 확장을 설치하여 작업성 측정이 가능할 것으로 보인다.


[지원하는 각종 플러그인들](https://wakatime.com/plugins)


