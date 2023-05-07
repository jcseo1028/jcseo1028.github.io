---
layout: posts
comments: true
title : "C++ Class 를 DLL 로 Export 하기"
categories: Development
tags: [ DLL, C#]
published: false
---

### C++ Class DLL Export

Trigger Module LTC-4000 을 자사 프로젝트에 사용하기 위함.

C++ Class -> DLL  -> C# Mashaling 처리 예정.

먼저 호출 가능한 C++ DLL 로 변경하는 방법을 찾아야 한다.

[참고 사이트](https://www.codeproject.com/Articles/14180/Using-Unmanaged-C-Libraries-DLLs-in-NET-Applicatio)

1. Export 할 Class 준비

2. Class 전체를 Export 할 경우에는, Export할 Class 에 __declspec(dllexport) 선언.

### Socket 관련 Link Error 관련 ( LNK2028 )

계속 링크 에러가 나더니.. 문제는 WinSock 관련 다음 처리가 안되서 그랬던 거 같다.

```cpp
#include <WinSock2.h>
#pragma comment(lib, "ws2_32.lib")
```

ws2_32.lib 를 처리하지 못해서 나타난 링크 에러인 듯하다. 처리 후 DLL 생성 완료.

### DLL 의 Entry Point 를 찾는 방법

Visual Studio 내부 도구인 dumpbin 을 활용한다.

```bsh
"C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\bin\dumpbin.exe" /exports  MyDll.Dll
```

이렇게 만들어진 DLL 을 C# 에서 불러오지 못해 다른 방법 검색.

---

### C++/CLI 를 통해 C# 에서 바로 사용하는 방법

[참고 링크](https://finoriko8.tistory.com/30)

차라리 이 방법으로 기존 C++ Code 를 변환하는 것이 나을 거 같다.

.NetFramework 버전을 잘못 맞춰서 삽질을 잠깐 하긴 했지만, 우선 Class 생성/소멸자까지는 완료했다.

---
